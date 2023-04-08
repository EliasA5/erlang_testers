Each branch is a tester for a different assignment.

to use download the testing file from the assignment branch, and place it inside the assignment directory, then open the erlang shell and write:
```erlang
c(ex3_tester).
ex3_tester:test().
```

if using git, you can add the tester repository as a submodule by:
```
git submodule add https://github.com/EliasA5/erlang_testers
git submodule set-branch --branch ex3 -- erlang_testers
cd erlang_testers
git checkout -b ex3 --track origin/ex3
cd ..
```

and to run it:
```erlang
c("erlang_testers:ex3_tester").
ex3_tester:test().
```


