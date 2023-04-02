each branch is a tester for a different assignment.

to use download the testing file from the assignment branch, and place it inside the assignment directory, then open the erlang shell and write:
'''erlang
c(ex{}_tester).
ex{}_tester:test().
'''

if using git, you can add the tester repository as a submodule by:
'''
git submodule add https://github.com/EliasA5/erlang_testers
'''
then inside the .gitmodules directory after url = ..., add the following line:
'''
branch = ex{}
'''
and then running 'git submodule update'


