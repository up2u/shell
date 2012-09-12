#! /bin/sh

# collect codesize of all object file and function size
# Usage: ./this-sh  object files directory [platform]
# Example: ./this-sh hardware_server/obj_um220  um220

#set -x

function usage()
{
	echo -e "\n usage : ./this-sh object files directory [platform]"
	echo -e " Example: ./this-sh hardware_server/obj_um220  um220\n"
}

if test $# -eq 0; then
	usage
	exit -1
fi

BASE_DIR=/work/zigbee/AndesZ
DATE=`date +'%Y%m%d'`
DATASHEET=${DATE}_size.xls

if test $# -gt 1; then
	PLATFORM=${2}
else
	PLATFORM=native
fi

if test ${PLATFORM} = "native"; then
	CPU=native
	TOOLCHAIN=""
elif test ${PLATFORM} = "um220"; then
	CPU=n801
	TOOLCHAIN="nds32le-elf-"
fi
SIZE="${TOOLCHAIN}size"

# find all dependent files
function find_all_file()
{
	if test `ls *.d | wc -l` -eq 0 ; then
		echo "not exist any dependent files, you should use Makefile to build it"
		exit -1
	fi
	if test -e all_file.log; then
		> all_file.log
	fi
    #truncate content before the first .c, some dependent file contain .c in 2nd line
	for dep_file in `ls *.d`
	do
		head -n 2 ${dep_file} | tr -d '\n' | awk -F'\\.c ' '{print $1}' >> all_file.log
	done
}

# find layer files
# args: directory [subdirectory]
function layer_file()
{
	if test ${2}; then
		grep "${1}/${2}" all_file.log > ${1}.${2}.log
		awk '{print $1}' ${1}.${2}.log | awk -F'/' '{print $NF}' >  ${1}.${2}.files
		sed -i "s#obj_${PLATFORM}/##" ${1}.${2}.files
	else
		grep "${1}/"     all_file.log > ${1}.log
		awk '{print $1}' ${1}.log | awk -F'/' '{print $NF}' >  ${1}.files
		sed -i "s#obj_${PLATFORM}/##" ${1}.files
	fi
}

# args: directory [subdirectory]
function code_size()
{
	if test ${2}; then
		${SIZE} `cat ${1}.${2}.files` | sed 1d
	else
		${SIZE} `cat ${1}.files`      | sed 1d
	fi
}

# args: table
function table_style()
{
	awk '{print "\t"$6"\t",$1"\t",$2"\t",$3"\t",$4}'  ${1}
}

# args: directory [subdirectory]
function directory()
{
	maindir=${1}
	if test ${2}; then
		shift
		for subdir in $@
		do
			layer_file ${maindir} ${subdir}
			echo -n "${maindir}/${subdir}" >> ${DATASHEET}
			code_size ${maindir} ${subdir} | table_style >> ${DATASHEET}
		done
	else
		layer_file ${maindir}
		echo -n "${1}" >> ${DATASHEET}
		code_size ${1} | table_style >> ${DATASHEET}
	fi
}

# args: cpu [cpu-type]
function code_size_assembly()
{
	find ${BASE_DIR}/${1}/${2} -name "*.[sS]" | awk -F'/' '{print $NF}' | sed 's/.[sS]/\.o/' > ${1}.${2}.files
	code_size ${1} ${2} | table_style >> ${DATASHEET}
}

# do process from here
cd ${1}

if test -e ${DATASHEET}; then
	> ${DATASHEET}
	echo -e "\tfilename\ttext\tdata\tbss\tdec" >> ${DATASHEET}
fi

find_all_file
## add subdirectory here

## zigbee
directory zigbee zdo security zcl cli_stub af aps nwk mac phy misc
## platform
directory platform ${PLATFORM}
## cpu
if test ${CPU} = "native"; then
	directory cpu ${CPU}
else
	code_size_assembly cpu ${CPU}
fi
## contiki
directory contiki

echo "collect code size done"

# got back
cd -
exit $?
