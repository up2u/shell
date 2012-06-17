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

3: change ecb-face.el in ecb directory
   to change colour 

[ume@galaxy lisp]$ git diff
diff --git a/ecb-2.40/ecb-face.el b/ecb-2.40/ecb-face.el
index 782d9bd..39b5185 100644
--- a/ecb-2.40/ecb-face.el
+++ b/ecb-2.40/ecb-face.el
@@ -325,8 +325,8 @@ to be set in 'ecb-history-dead-buffer-face' too!"
 
 (defface ecb-default-highlight-face (ecb-face-default nil nil nil
                                                       nil ;'ecb-default-general-face
-                                                      "yellow" nil
-                                                      "cornflower blue" "magenta"
+                                                      nil "black"
+                                                      nil "yellow"
                                                       nil nil t)
   "*Define basic face for highlighting the selected node in a tree-buffer.
 In GNU Emacs 21.X all highlighting faces in the ECB tree-buffers inherit from
