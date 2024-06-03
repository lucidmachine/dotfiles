local foldwords = {
  'def',
  'defn',
  'defmacro',
  'defmethod',
  'defschema',
  'defprotocol',
  'defrecord',
  'deftest',
  'comment',
  'testing'
}
vim.g.clojure_foldwords = table.concat(foldwords, ',')
