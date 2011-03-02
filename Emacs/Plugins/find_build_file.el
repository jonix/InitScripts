;; inspired by jds-find-tags-file in http://www.emacswiki.org/emacs/EmacsTags
(defun find-build-file ()
	"recursively searches upwards from buffer's current dir for file named CMakeFileLists.txt and returns that dir. Or nil if not found or if buffer is not visiting a file"
  (labels
      ((find-build-file-r (path)
													(let* ((parent (file-name-directory path))
																 (possible-file (concat parent "CMakeLists.txt")))
														(cond
														 ((file-exists-p possible-file)
															(throw 'found-it possible-file))
														 ((string= "/CMakeLists.txt" possible-file)
															(error "No CMakeLists.txt found"))
														 (t (find-build-file-r (directory-file-name parent)))))))
    (if (buffer-file-name)
        (catch 'found-it
          (find-build-file-r (buffer-file-name)))
      (error "Buffer is not visiting a file"))))


(defun project-root ()
  (file-name-directory (find-build-file)))
