;; Lang helpers

(fn seq? [t]
  "Returns true when a table only has numeric keys."
  (not
    (accumulate [result false
                 k _ (pairs t)]
      (or result (not= (type k) :number)))))

(fn string-split [str sep]
  "Splits a string by `sep`."
  (icollect [part (string.gmatch str (.. "([^" sep "]+)"))]
    part))

(fn filter [t f]
  "Filters a table using function `f`."
  (icollect [_ v# (ipairs t)]
    (if (f v#)
       v#
       nil)))

(fn contains? [t v]
  "Returns true if a given value exists in a table, whether as an item (seq?) or as a key (not seq?)"
  (if (seq? t)
    (do
      (var found false)
      (each [_ curr (ipairs t) &until found]
        (when (= v curr)
          (set found true)))
      found)
    (not= nil (. t v))))

{: seq?
 : string-split
 : filter
 : contains?}
