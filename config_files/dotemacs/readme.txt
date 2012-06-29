1: get ecb-newcedet

[ume@galaxy ecb-newcedet]$ git rmt -v
origin	git://github.com/alexott/ecb.git (fetch)
origin	git://github.com/alexott/ecb.git (push)

2: new branch
[ume@galaxy ecb-newcedet]$ git br -a
  master
* newcedet
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
  remotes/origin/new-cedet

3: new branch
  git co -b newcedet origin/new-cedet

4: update
   git pull origin new-cedet:newcedet
