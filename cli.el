;;; cli.el -*- lexical-binding: t; -*-

;; https://github.com/doomemacs/doomemacs/issues/5592#issuecomment-1210682905
(after! comp
  ;; HACK Disable native-compilation for some troublesome packages
  (mapc (doom-partial #'add-to-list 'native-comp-deferred-compilation-deny-list)
        (list "/emacs-jupyter.*\\.el\\'"
              "/evil-collection-vterm\\.el\\'"
              "/vterm\\.el\\'"
              "/with-editor\\.el\\'")))

(defcli! tangle ()
  "Tangle the literate configuration."
  (progn
   (require 'ob-tangle)
   (let* ((default-directory doom-private-dir)
          (src-file (expand-file-name "config.org" default-directory))
          (target-file (expand-file-name "config.el" default-directory)))
     (org-babel-tangle-file src-file target-file))))
