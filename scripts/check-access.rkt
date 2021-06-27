#lang racket

;; run this file in the build process to check that the RKTWORK machine
;; has the privileges required to run these scripts. no test failures = good to go

(require rackunit)

(define pref-dir (find-system-path 'pref-dir))


(check-pred
 string?
 (call-with-input-file
     (build-path pref-dir "github-user-credentials.rktd") read))

(check-match
 (call-with-input-file
     (build-path pref-dir "github-poll-client.rktd") read)
 (list (? string?) ...))