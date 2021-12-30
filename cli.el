;;; cli.el -*- lexical-binding: t; -*-

(defcli! tangle ()
  "Tangle the literate configuration."
  (progn
   (require 'ob-tangle)
   (let* ((default-directory doom-private-dir)
          (src-file (expand-file-name "config.org" default-directory))
          (target-file (expand-file-name "config.el" default-directory)))
     (org-babel-tangle-file src-file target-file))))
