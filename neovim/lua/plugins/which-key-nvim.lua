require('which-key').register({
  b = { name = '(B)uffers' },
  c = {
    name = '(C)opy',
    c = 'Buffer',
    p = 'Relative (p)ath',
    P = 'Absolute (p)ath',
  },
  d = {
    name = '(D)iagnostics',
    l = '(L)ocationlist',
    n = '(N)ext',
    o = '(O)pen',
    p = '(P)revious',
    q = '(Q)uickfixlist',
  },
  f = { name = '(F)iles' },
  g = { name = '(G)oto' },
  l = { name = '(L)ocationlist' },
  q = { name = '(Q)uickfixlist' },
  r = {
    name = '(R)efactor',
    a = '(A)ctions',
    l = '(L)ayout',
    o = '(O)ptimize imports',
    r = '(R)ename (Scalpel)',
    R = '(R)ename (LSP)',
  },
  s = { name = '(S)earch' },
  t = { name = '(T)oggle / Cycle' },
  v = { name = '(V)im' },
  w = { name = '(W)indow' },
}, { prefix = "<Leader>" })
