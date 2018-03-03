(load "/home/xuedong/.opam/system/share/emacs/site-lisp/tuareg-site-file")

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))
       ;; Register Merlin
       (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
       (autoload 'merlin-mode "merlin" nil t nil)
       ;; Automatically start it in OCaml buffers
       (add-hook 'tuareg-mode-hook 'merlin-mode t)
       (add-hook 'caml-mode-hook 'merlin-mode t)
       ;; Use opam switch to lookup ocamlmerlin binary
       (setq merlin-command 'opam)))

(add-to-list 'custom-theme-load-path "/home/xuedong/.emacs.d/themes")
(load-theme 'spolsky t)

(tool-bar-mode -1)

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		                        (not (gnutls-available-p))))
              (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
    (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
