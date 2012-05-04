1:
in file ecb-upgrade.el
comment the following line in function  ecb-check-requirements

         ;; check if vedet-version is correct  
    when (or (not (boundp 'cedet-version))  
            (ecb-package-version-list<  
            (ecb-package-version-str2list cedet-version)  
             ecb-required-cedet-version-min)  
            (ecb-package-version-list<  
             ecb-required-cedet-version-max  
             (ecb-package-version-str2list cedet-version)))  
    (setq version-error (concat "cedet ["  
                               cedet-required-version-str-min  
                               ", "  
                               cedet-required-version-str-max  
                              "]")))  


2: because of semantic-tag-folding.el not part of cedet, so need
cp semantic-tag-folding.el cedet-1.1/semantic/semantic-tag-folding.el
