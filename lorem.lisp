;;;; Make a number of files based on lorem ipsum text.

(cl:defpackage :lorem-files
    (:use #:cl
          #:cl-utilities))

(setf lorem "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

(setf path "/home/gt/urbit/test/")

(defun words (str)
  "Split a string on spaces."
   (cl-utilities:split-sequence #\Space str))

(defun alpha-only<- (word)
  "Remove non-alphanumeric characters from a string."
  (coerce (remove-if-not #'alpha-char-p (coerce word 'list)) 'string))

(defun make-file (fname)
  "Make a new (empty) file at path+fname."
  (with-open-file (s (concatenate 'string path fname) :if-does-not-exist :create)))


(mapcar #'make-file (mapcar #'alpha-only<- (words lorem)))




