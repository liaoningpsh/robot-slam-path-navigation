
(cl:in-package :asdf)

(defsystem "lingao_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "LingAoBmsStatus" :depends-on ("_package_LingAoBmsStatus"))
    (:file "_package_LingAoBmsStatus" :depends-on ("_package"))
    (:file "LingAoRCStatus" :depends-on ("_package_LingAoRCStatus"))
    (:file "_package_LingAoRCStatus" :depends-on ("_package"))
  ))