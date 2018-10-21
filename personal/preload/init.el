;; (setq prelude-theme 'solarized-dark)
;; (setq prelude-theme 'tango)
(set-default-font "Monaco 14")

(toggle-scroll-bar -1)
;; for new frames
;; (add-hook 'after-make-frame-functions
;;          '(lambda (frame)
;;             (modify-frame-parameters frame
;;                                      '((vertical-scroll-bars . nil)
;;                                        (horizontal-scroll-bars . nil)))))

;; (setq prelude-whitespace nil)

;;; You email address
(setq user-mail-address "mvitorino@gmail.com")

;; show battery percentage in mode line
(setq battery-mode-line-format "[%b%p%%]") ;; "#%b %p %t" ;; "[%b%p%%]"
(setq battery-load-critical 7)
(display-battery-mode t)

;; display current time
;;(setq display-time-day-and-date nil)
;;(setq display-time-24hr-format nil)
(setq display-time-format " %H:%M"
      display-time-default-load-average nil)
(display-time-mode 1)
