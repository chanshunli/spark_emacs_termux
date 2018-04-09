(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(windmove-default-keybindings)

(global-set-key
 (kbd "C-c C-o")
 (lambda ()
   (interactive)
   (save-buffers-kill-emacs)))

(defvar home-path "/data/data/com.termux/files/home/JIM_EMACS")
(load-file (concat home-path "/queue-0.2.el"))

(require 'helm-projectile)
(helm-projectile-on)

(defun h-find-file ()
  (interactive)
  (helm-projectile-find-file))
(define-key global-map (kbd "C-p") 'h-find-file)

(add-to-list 'custom-theme-load-path (concat home-path "/themes/") )
(load-theme 'monokai t)

(global-set-key
 (kbd "C-c m")
 (lambda ()
   (interactive)
   (goto-char (point-max))))

(define-key global-map (kbd "C-c k") 'ido-kill-buffer)

(defun clj-eval-sexp (sexp)
  (interactive "sClJ-EVAL:")
  (cider-interactive-eval sexp))
(define-key global-map (kbd "M-\"") 'clj-eval-sexp)

(define-key global-map (kbd "M-g") 'goto-line)

(require 'helm)
(require 'helm-config)

(helm-mode 1)
(helm-autoresize-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-M-x-fuzzy-match                  t   ; 模糊搜索
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match               t
      helm-recentf-fuzzy-match              t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

(provide 'init-helm)

