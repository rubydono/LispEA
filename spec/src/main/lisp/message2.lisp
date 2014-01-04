(defclass message ()
  (
   (headers :accessor message-headers :initarg :headers)
   (body :accessor message-body :initarg :body)
   )
  )

(let ((my-message (make-instance 'message :headers '((from . "RubyTuesdayDONO") (to . "oozynozh")))))
  `(headers ,(message-headers my-message))
)
