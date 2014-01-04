(ns read
    "LISP-reading tests"
    (:use [clojure.test])
)

(defn read-from-file-with-trusted-contents [filename]
  (with-open [r (java.io.PushbackReader.
                 (clojure.java.io/reader filename))]
		 (binding [*read-eval* false]
			  (read r))))
(deftest readlisp
  (let [
	myform (read-from-file-with-trusted-contents (clojure.java.io/resource "spec.lisp"))
	]
    (prn myform)
    (is (list? myform))
    )
  )

(defn test-ns-hook []
  (readlisp)
)

