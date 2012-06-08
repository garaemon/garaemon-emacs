(require 'garaemon-util)
(when-cocoa
 ;; フォントフェースの設定
 ;; see http://d.hatena.ne.jp/kazu-yamamoto/20090122/1232589385
 (set-face-attribute 'default nil
		     :family "monaco"
		     :height 120)
 ;; 日本語フォント: ヒラギノ丸ゴシック 
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'katakana-jisx0201
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 )
