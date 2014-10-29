;;;; aerique-dark-theme.el --- A partitioning color theme for Emacs.
;;;;
;;;; Copyright 2014, Erik Winkels <aerique@xs4all.nl>
;;;
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
;;;; This theme won't work right by just doing a LOAD-THEME.  I haven't looked
;;;; into it, but I assume it is because of the multiple :INHERITs of its own
;;;; faces.  To get it working:
;;;;
;;;;     (when (>= emacs-major-version 24)
;;;;       (add-to-list 'custom-theme-load-path "«theme-directory»")
;;;;       (load "«theme-directory»/aerique-dark-theme")
;;;;       (load-theme 'aerique-dark t))

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
       (default `((t :foreground ,ad-gray-lightest :background ,ad-darkest)))
       (bold    `((t :bold t)))
       (error   `((t :foreground ,ad-red))))
  (defface powerline-active-erc2
           `((t (:inherit powerline-active2 :foreground ,ad-highlight)))
           "Powerline face 2 for ERC notifications."
           :group 'powerline)
  (defface powerline-inactive-erc2
           `((t (:inherit powerline-inactive2 :foreground ,ad-highlight)))
           "Powerline face 2 for ERC notifications."
           :group 'powerline)
  ;; Baseline, everything either inherits from these or uses the above colors.
  (custom-theme-set-faces 'aerique-dark
    `(default ,default)
    `(bold ,bold)
    `(dired-directory ((t :foreground ,ad-link)))
    `(dired-symlink ((t :foreground ,ad-highlight)))
    `(error ,error)
    `(link ((t :foreground ,ad-link :underline t)))
    `(mode-line ((t :foreground ,ad-darkest :background ,ad-gray-light
                    :box nil)))
    `(warning ((t :foreground ,ad-highlight)))
    `(font-lock-builtin-face ((t :foreground ,ad-keyword)))
    `(font-lock-comment-delimiter-face ((t :foreground ,ad-comment)))
    `(font-lock-comment-face ((t :foreground ,ad-comment)))
    `(font-lock-constant-face ,default)
    `(font-lock-doc-face ((t :foreground ,ad-comment)))
    `(font-lock-function-name-face ,default)
    `(font-lock-keyword-face ,default)
    `(font-lock-negation-char-face ,default)
    `(font-lock-preprocessor-face ,default)
    `(font-lock-regexp-grouping-backslash ,default)
    `(font-lock-regexp-grouping-construct ,default)
    `(font-lock-string-face ((t :foreground ,ad-string)))
    `(font-lock-type-face ,default)
    ;; Sigh.. this adds some needed partitioning for C++ but it's too much for
    ;; other languages.
    ;`(font-lock-type-face ((t :foreground "#8f8fbc")))
    `(font-lock-variable-name-face ,default)
    `(font-lock-warning-face ,error))
  (custom-theme-set-faces 'aerique-dark
    ;; The rest...
    `(button ((t :inherit link)))
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
    ;`(company-tooltip-common-selection ((t :foreground ,ad-lightest
    ;                                       :background "#0088ff")))
    `(company-tooltip-common-selection ((t :foreground ,ad-darkest
                                           :background ,ad-highlight)))
    `(company-tooltip-mouse ((t :foreground "green" :background "magenta")))
    ;`(company-tooltip-selection ((t :foreground ,ad-lightest
    ;                                :background "#0088ff")))
    `(company-tooltip-selection ((t :foreground ,ad-darkest
                                    :background ,ad-keyword)))
    `(compilation-info ((t :inherit font-lock-builtin-face)))
    `(compilation-line-number ((t :inherit font-lock-builtin-face)))
    `(cua-rectangle ((t :background ,ad-gray-dark)))
    `(cursor ((t :background ,ad-highlight :foreground ,ad-darkest)))
    ;; Using extra colors here, haven't thought of a better solution (problem
    ;; is on my current Emacs with split windows the left-most line of the
    ;; fringe dissapears, otherwise I could just have used a lighter gray).
    `(diff-hl-change ((t :foreground ,ad-link :background "#003333")))
    `(diff-hl-delete ((t :foreground ,ad-comment :background "#330000")))
    `(diff-hl-insert ((t :foreground ,ad-keyword :background "#005500")))
    `(diredp-date-time ((t :inherit default)))
    `(diredp-dir-heading ((t :inherit default)))
    `(diredp-dir-priv ((t :inherit dired-directory)))
    `(diredp-exec-priv ((t :inherit default)))
    `(diredp-ignored-file-name ((t :foreground ,ad-gray-light)))
    `(diredp-file-name ((t :inherit default)))
    `(diredp-file-suffix ((t :inherit default)))
    `(diredp-link-priv ((t :inherit default)))
    `(diredp-no-priv ((t :inherit default)))
    `(diredp-number ((t :inherit default)))
    `(diredp-read-priv ((t :inherit default)))
    `(diredp-symlink ((t :inherit dired-symlink)))
    `(diredp-write-priv ((t :inherit default)))
    `(erc-input-face ((t :inherit font-lock-builtin-face)))
    `(erc-my-nick-face ((t :bold t :inherit font-lock-builtin-face)))
    `(erc-notice-face ((t :foreground ,ad-gray-light)))
    `(erc-prompt-face ((t :inverse-video t)))
    `(erc-timestamp-face ((t :foreground ,ad-gray-light)))
    `(escape-glyph ((t :inherit font-lock-warning-face)))
    `(eshell-ls-archive ((t :inherit font-lock-string-face)))
    `(eshell-ls-backup ((t :inherit font-lock-string-face)))
    `(eshell-ls-directory ((t :inherit dired-directory)))
    `(eshell-ls-executable ((t :inherit font-lock-builtin-face)))
    `(eshell-ls-readonly ((t :inherit font-lock-comment-face)))
    `(eshell-ls-symlink ((t :inherit dired-symlink)))
    `(eshell-prompt ((t :inherit dired-directory)))
    `(fg:erc-color-face12 ((t :inherit dired-directory)))  ; too dark otherwise
    `(flyspell-duplicate ((t :underline t :inherit warning)))
    `(flyspell-incorrect ((t :underline t :inherit font-lock-comment-face)))
    `(fringe ((t :background ,ad-gray-darkest)))
    `(header-line ((t :box nil :inherit mode-line :foreground ,ad-gray-lightest
                      :background ,ad-gray-darkest)))
    `(helm-ff-directory ((t :inherit dired-directory)))
    `(helm-ff-executable ((t :inherit font-lock-builtin-face)))
    `(helm-ff-file ((t :inherit default)))
    `(helm-ff-symlink ((t :inherit dired-symlink)))
    `(highlight ((t :background ,ad-highlight :foreground ,ad-darkest)))
    `(hl-line ((t :background ,ad-gray-dark)))
    `(isearch ((t :background ,ad-lightest :foreground ,ad-darkest)))
    `(jabber-activity-face ((t :foreground ,ad-string)))
    `(jabber-activity-personal-face ((t :foreground ,ad-highlight)))
    `(jabber-chat-prompt-local ((t :inherit bold)))
    `(jabber-rare-time-face ((t :inherit font-lock-builtin-face :underline t)))
    `(jabber-roster-user-online ((t :inherit font-lock-builtin-face)))
    `(jabber-roster-user-away ((t :inherit font-lock-string-face)))
    `(jabber-title-large ((t :inherit variable-pitch :bold t :height 1.8)))
    `(jabber-title-medium ((t :inherit variable-pitch :bold t :height 1.4)))
    `(js2-function-param ((t :inherit default)))
    `(js2-jsdoc-tag ((t :inherit font-lock-comment-face)))
    `(js2-jsdoc-type ((t :inherit font-lock-comment-face)))
    `(js2-jsdoc-value ((t :inherit font-lock-comment-face)))
    `(js2-external-variable ((t :inherit font-lock-builtin-face)))
    `(lazy-highlight ((t :background ,ad-gray-light :foreground ,ad-darkest)))
    `(link-visited ((t :foreground ,ad-string :underline t)))
    `(minibuffer-prompt ((t :inherit bold)))
    ;`(magit-item-highlight ((t :inherit default)))
    `(magit-item-highlight ((t)))
    ;; Check magit-mode diff red and green (on Linux) for nice colors.
    `(magit-diff-add ((t :inherit font-lock-builtin-face)))
    `(magit-diff-del ((t :inherit font-lock-comment-face)))
    `(magit-diff-file-header ((t :inherit bold)))
    `(magit-diff-hunk-header ((t :inherit bold :foreground ,ad-link)))
    `(magit-log-sha1 ((t :foreground ,ad-highlight)))
    `(match ((t :inherit dired-symlink)))
    `(message-header-name ((t :inherit font-lock-builtin-face)))
    `(message-header-other ((t :inherit font-lock-builtin-face)))
    `(message-separator ((t :inherit font-lock-comment-face)))
    `(mode-line-buffer-id ((t :inherit bold)))
    `(mode-line-emphasis ((t :inherit bold)))
    `(mode-line-highlight ((t :foreground ,ad-darkest
                              :background ,ad-lightest)))
    `(mode-line-inactive ((t :foreground ,ad-darkest :background ,ad-gray-dark
                             :box nil :inherit mode-line)))
    `(mu4e-header-highlight-face ((t :inverse-video t)))
    `(mu4e-unread-face ((t :inherit dired-directory)))
    `(mu4e-view-header-key-face ((t :inherit font-lock-builtin-face)))
    `(mu4e-view-header-value-face ((t :inherit font-lock-builtin-face)))
    `(org-block ((t :inherit font-lock-string-face)))
    `(org-code ((t :inherit font-lock-string-face)))
    `(org-date ((t :inherit link)))
    `(org-done ((t :bold t :inherit font-lock-builtin-face)))
    `(org-document-info ((t :inherit org-document-info-keyword)))
    `(org-document-title ((t :inherit org-document-info-keyword)))
    `(org-level-1 ((t :inherit bold)))
    `(org-level-2 ((t :inherit bold)))
    `(org-level-3 ((t :inherit bold)))
    `(org-level-4 ((t :inherit bold)))
    `(org-level-5 ((t :inherit bold)))
    `(org-level-6 ((t :inherit bold)))
    `(org-level-7 ((t :inherit bold)))
    `(org-level-8 ((t :inherit bold)))
    `(org-link ((t :inherit link)))
    `(org-table ((t :inherit font-lock-builtin-face)))
    `(org-todo ((t :bold t :inherit font-lock-comment-face)))
    `(powerline-evil-emacs-face ((t :background ,ad-red)))
    `(powerline-evil-insert-face ((t :background ,ad-keyword)))
    `(powerline-evil-motion-face ((t :background ,ad-link)))
    `(powerline-evil-normal-face ((t :background ,ad-comment)))
    `(powerline-evil-operator-face ((t :background ,ad-link)))
    `(powerline-evil-visual-face ((t :background ,ad-string)))
    `(region ((t :background ,ad-gray-dark)))
    `(sh-quoted-exec ((t :inherit default)))
    `(shadow ((t :foreground ,ad-gray-light)))
    `(show-paren-match ((t :inverse-video t)))
    `(slime-repl-input-face ((t :inherit default)))
    `(slime-repl-inputed-output-face ((t :foreground ,ad-gray-light)))
    `(slime-repl-output-face ((t :inherit font-lock-comment-face)))
    `(slime-repl-prompt-face ((t :inherit bold)))
    `(sp-pair-overlay-face ((t)))
    `(vertical-border ((t :foreground ,ad-darkest)))
    `(trailing-whitespace ((t :background ,ad-comment)))
    `(warning ((t :foreground ,ad-highlight)))
    `(which-func ((t :foreground ,ad-gray-lightest)))
    `(whitespace-tab ((t :foreground ,ad-gray-dark)))))

(provide-theme 'aerique-dark)
