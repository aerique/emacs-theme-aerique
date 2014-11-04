;;;; aerique-dark-theme.el --- A partitioning color theme for Emacs.
;;;;
;;;; Copyright 2014, Erik Winkels <aerique@xs4all.nl>
;;;;
;;;; Author   : Erik Winkels
;;;; Keywords : color theme aerique dark aerique-dark
;;;; URL      : <https://github.com/aerique/emacs-aerique-dark-theme.git>
;;;; Version  : 0.2 (2014-10-21)
;;;;
;;;; Package-Requires: ((emacs "24"))
;;;;
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.
;;;;
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;;;; GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program. If not, see <http://www.gnu.org/licenses/>.
;;;;
;;;; This file is not part of Emacs.
;;;;
;;;; Commentary:
;;;;
;;;; This theme won't work right by just doing a LOAD-THEME and I can't get
;;;; figured out why.  "error" stays bold and "whitespace-tab" keeps a gray
;;;; background.  To get it working:
;;;;
;;;;     (when (>= emacs-major-version 24)
;;;;       (add-to-list 'custom-theme-load-path "«theme-directory»")
;;;;       (load "«theme-directory»/aerique-dark-theme")
;;;;       (load-theme 'aerique-dark t))
;;;;
;;;; With regards to minimizing syntax highlighting there's ofcourse
;;;; font-lock-maximum-decoration but who uses that?  Switching themes is
;;;; easier.
;;;;
;;;; Legend:
;;;;
;;;; green:              red:                    harsh red:
;;;; - executable files  - compressed files      - errors
;;;; - diff adds         - diff removals         - warnings
;;;; - Lisp keywords     - source code comments
;;;; - Python builtins   - org todo
;;;; - online indicator  - extended away indicator
;;;; - irc own text
;;;; - org done
;;;;
;;;; cyan:               yellow:                 brown:
;;;; - directories       - changed buffers       - strings
;;;; - hyperlinks        - highlights            - away indicator
;;;; - irc mentions      - symbolic links

;;;; Code:

(deftheme aerique-dark
  "Theme centered on minimal syntax highlighting and distinct but not too
  harsh or distracting colors.  The only active font-lock faces are:
  builtin, comment and string.

  The point of this theme is not highlighting all kinds of different syntax
  but partitioning the source code in easily scannable pieces.")

(let* ((ad-comment       "#cd5c5c")  ; indian red
       (ad-highlight     "#ffff00")  ; yellow
       (ad-keyword       "#8fbc8f")  ; dark sea green
       (ad-link          "#00cccc")  ; cyan
       (ad-string        "#cc8162")  ; LightSalmon3
       (ad-darkest       "#000000")  ; black
       (ad-lightest      "#ffffff")  ; white
       (ad-gray-darkest  "#292929")  ; gray16
       (ad-gray-dark     "#525252")  ; gray32
       (ad-gray-light    "#a3a3a3")  ; gray64
       (ad-gray-lightest "#e0e0e0")  ; gray88
       (ad-red           "#ff0000")  ; red
       (default                `((t :foreground ,ad-gray-lightest
                                    :background ,ad-darkest)))
       (bold                   `((t :bold t)))
       (directory              `((t :foreground ,ad-link)))
       (symlink                `((t :foreground ,ad-highlight)))
       (error                  `((t :foreground ,ad-red)))
       (font-lock-builtin-face `((t :foreground ,ad-keyword)))
       (font-lock-comment-face `((t :foreground ,ad-comment)))
       (font-lock-string-face  `((t :foreground ,ad-string)))
       (link                   `((t :foreground ,ad-link :underline t))))
  (defface powerline-active-erc2
           `((t (:inherit powerline-active2 :foreground ,ad-highlight)))
           "Powerline face 2 for ERC notifications."
           :group 'powerline)
  (defface powerline-inactive-erc2
           `((t (:inherit powerline-inactive2 :foreground ,ad-highlight)))
           "Powerline face 2 for ERC notifications."
           :group 'powerline)
  (custom-theme-set-faces 'aerique-dark
    `(bold ,bold)
    `(button ,link)
    ;; I haven't figured out the company-* faces marked with magenta yet.
    `(company-echo ((t :foreground "green" :background "magenta")))
    `(company-echo-common ((t :foreground "green" :background "magenta")))
    `(company-preview ((t :foreground "green" :background "magenta")))
    `(company-preview-common ((t :foreground ,ad-gray-dark
                                 :background ,ad-darkest)))
    `(company-preview-search ((t :foreground "green" :background "magenta")))
    `(company-scrollbar-bg ((t :background ,ad-gray-dark)))
    `(company-scrollbar-fg ((t :background ,ad-darkest)))
    `(company-template-field ((t :foreground "green" :background "magenta")))
    `(company-tooltip ((t :foreground ,ad-darkest
                          :background ,ad-gray-lightest)))
    `(company-tooltip-common ((t :foreground ,ad-darkest
                                 :background ,ad-lightest)))
    `(company-tooltip-common-selection ((t :foreground ,ad-darkest
                                           :background ,ad-highlight)))
    `(company-tooltip-mouse ((t :foreground "green" :background "magenta")))
    `(company-tooltip-selection ((t :foreground ,ad-darkest
                                    :background ,ad-keyword)))
    `(compilation-info ,font-lock-builtin-face)
    `(compilation-line-number ,font-lock-builtin-face)
    `(cua-rectangle ((t :background ,ad-gray-dark)))
    `(cursor ((t :background ,ad-highlight :foreground ,ad-darkest)))
    `(default ,default)
    ;; Using extra colors here, haven't thought of a better solution (problem
    ;; is on my current Emacs with split windows the left-most line of the
    ;; fringe dissapears, otherwise I could just have used a lighter gray).
    `(diff-hl-change ((t :foreground ,ad-link :background "#003333")))
    `(diff-hl-delete ((t :foreground ,ad-comment :background "#330000")))
    `(diff-hl-insert ((t :foreground ,ad-keyword :background "#005500")))
    `(dired-directory ,directory)
    `(dired-symlink ,symlink)
    `(diredp-date-time ,default)
    `(diredp-dir-heading ,default)
    `(diredp-dir-priv ,directory)
    `(diredp-exec-priv ,default)
    `(diredp-ignored-file-name ((t :foreground ,ad-gray-light)))
    `(diredp-file-name ,default)
    `(diredp-file-suffix ,default)
    `(diredp-link-priv ,default)
    `(diredp-no-priv ,default)
    `(diredp-number ,default)
    `(diredp-read-priv ,default)
    `(diredp-symlink ,symlink)
    `(diredp-write-priv ,default)
    `(erc-input-face ,font-lock-builtin-face)
    `(erc-my-nick-face ,font-lock-builtin-face)
    `(erc-notice-face ((t :foreground ,ad-gray-light)))
    `(erc-prompt-face ((t :inverse-video t)))
    `(erc-timestamp-face ((t :foreground ,ad-gray-light)))
    `(error ,error)
    `(escape-glyph ,error)
    `(eshell-ls-archive ,font-lock-string-face)
    `(eshell-ls-backup ,font-lock-string-face)
    `(eshell-ls-directory ,directory)
    `(eshell-ls-executable ,font-lock-builtin-face)
    `(eshell-ls-readonly ,font-lock-comment-face)
    `(eshell-ls-symlink ,symlink)
    `(eshell-prompt ,directory)
    `(fg:erc-color-face12 ,directory)  ; too dark otherwise
    `(flyspell-duplicate ((t :foreground ,ad-red :underline t)))
    `(flyspell-incorrect ((t :foreground ,ad-comment :underline t)))
    `(font-lock-builtin-face ,font-lock-builtin-face)
    `(font-lock-comment-delimiter-face ,font-lock-comment-face)
    `(font-lock-comment-face ,font-lock-comment-face)
    `(font-lock-constant-face ,default)
    `(font-lock-doc-face ,font-lock-comment-face)
    `(font-lock-function-name-face ,default)
    `(font-lock-keyword-face ,default)
    `(font-lock-negation-char-face ,default)
    `(font-lock-preprocessor-face ,default)
    `(font-lock-regexp-grouping-backslash ,default)
    `(font-lock-regexp-grouping-construct ,default)
    `(font-lock-string-face ,font-lock-string-face)
    `(font-lock-type-face ,default)
    ;; Sigh.. this adds some needed partitioning for C++ but it's too much for
    ;; other languages.
    ;`(font-lock-type-face ((t :foreground "#8f8fbc")))
    `(font-lock-variable-name-face ,default)
    `(font-lock-warning-face ,error)
    `(fringe ((t :background ,ad-gray-darkest)))
    `(header-line ((t :foreground ,ad-gray-lightest
                      :background ,ad-gray-darkest :box nil)))
    `(helm-ff-directory ,directory)
    `(helm-ff-executable ,font-lock-builtin-face)
    `(helm-ff-file ,default)
    `(helm-ff-symlink ,symlink)
    `(highlight ((t :background ,ad-highlight :foreground ,ad-darkest)))
    `(hl-line ((t :background ,ad-gray-dark)))
    `(isearch ((t :background ,ad-lightest :foreground ,ad-darkest)))
    `(jabber-activity-face ((t :foreground ,ad-string)))
    `(jabber-activity-personal-face ((t :foreground ,ad-highlight)))
    `(jabber-chat-prompt-local ,bold)
    `(jabber-rare-time-face ((t :foreground ,ad-keyword :underline t)))
    `(jabber-roster-user-away ,font-lock-string-face)
    `(jabber-roster-user-offline ((t :foreground ,ad-gray-light)))
    `(jabber-roster-user-online ,font-lock-builtin-face)
    `(jabber-roster-user-xa ,font-lock-comment-face)
    `(jabber-title-large ((t :inherit variable-pitch :bold t :height 1.8)))
    `(jabber-title-medium ((t :inherit variable-pitch :bold t :height 1.4)))
    `(js2-function-param ,default)
    `(js2-jsdoc-tag ,font-lock-comment-face)
    `(js2-jsdoc-type ,font-lock-comment-face)
    `(js2-jsdoc-value ,font-lock-comment-face)
    `(js2-external-variable ,font-lock-builtin-face)
    `(lazy-highlight ((t :background ,ad-gray-light :foreground ,ad-darkest)))
    `(link ,link)
    `(link-visited ((t :foreground ,ad-string :underline t)))
    `(minibuffer-prompt ,bold)
    `(magit-item-highlight ((t)))
    `(magit-diff-add ,font-lock-builtin-face)
    `(magit-diff-del ,font-lock-comment-face)
    `(magit-diff-file-header ,bold)
    `(magit-diff-hunk-header ((t :bold t :foreground ,ad-link)))
    `(magit-log-sha1 ((t :foreground ,ad-highlight)))
    `(match ,symlink)
    `(message-header-name ,font-lock-builtin-face)
    `(message-header-other ,font-lock-builtin-face)
    `(message-separator ,font-lock-comment-face)
    `(mode-line ((t :foreground ,ad-darkest :background ,ad-gray-light
                    :box nil)))
    `(mode-line-buffer-id ,bold)
    `(mode-line-emphasis ,bold)
    `(mode-line-highlight ((t :foreground ,ad-darkest
                              :background ,ad-lightest)))
    `(mode-line-inactive ((t :foreground ,ad-darkest :background ,ad-gray-dark
                             :box nil)))
    `(mu4e-header-highlight-face ((t :inverse-video t)))
    `(mu4e-unread-face ,directory)
    `(mu4e-view-header-key-face ,font-lock-builtin-face)
    `(mu4e-view-header-value-face ,font-lock-builtin-face)
    `(org-block ,font-lock-string-face)
    `(org-code ,font-lock-string-face)
    `(org-date ,link)
    `(org-done ((t :foreground ,ad-keyword :bold t)))
    `(org-document-info ((t :inherit org-document-info-keyword)))
    `(org-document-title ((t :inherit org-document-info-keyword)))
    `(org-level-1 ,bold)
    `(org-level-2 ,bold)
    `(org-level-3 ,bold)
    `(org-level-4 ,bold)
    `(org-level-5 ,bold)
    `(org-level-6 ,bold)
    `(org-level-7 ,bold)
    `(org-level-8 ,bold)
    `(org-link ,link)
    `(org-table ,font-lock-builtin-face)
    `(org-todo ((t :foreground ,ad-comment :bold t)))
    `(powerline-evil-emacs-face ((t :background ,ad-red)))
    `(powerline-evil-insert-face ((t :background ,ad-keyword)))
    `(powerline-evil-motion-face ((t :background ,ad-link)))
    `(powerline-evil-normal-face ((t :background ,ad-comment)))
    `(powerline-evil-operator-face ((t :background ,ad-link)))
    `(powerline-evil-visual-face ((t :background ,ad-string)))
    `(region ((t :background ,ad-gray-dark)))
    `(sh-quoted-exec ,default)
    `(shadow ((t :foreground ,ad-gray-light)))
    `(show-paren-match ((t :inverse-video t)))
    `(slime-repl-input-face ,default)
    `(slime-repl-inputed-output-face ((t :foreground ,ad-gray-light)))
    `(slime-repl-output-face ,font-lock-comment-face)
    `(slime-repl-prompt-face ,bold)
    `(sp-pair-overlay-face ((t)))
    `(vertical-border ((t :foreground ,ad-darkest)))
    `(trailing-whitespace ((t :background ,ad-comment)))
    `(warning ((t :foreground ,ad-highlight)))
    `(which-func ((t :foreground ,ad-gray-lightest)))
    `(whitespace-tab ((t :foreground ,ad-gray-dark)))))

(provide-theme 'aerique-dark)
