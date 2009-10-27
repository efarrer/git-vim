" Test using the 'r' key to interactively remove a deleted file within GitStatus

source helpers/status_setup.vim
call StartTapWithPlan(2)

" Remove the file in the filesystem
silent !rm ../git_tmpdir/second_file.txt

GitStatus

call vimtap#Like(BufferContent(), 'deleted', 'The file shows up as deleted')

" Go to the line and hit 'r' to remove it from the git
/deleted:
normal r

call vimtap#Unlike(BufferContent(), 'deleted', 'The file no longer appears in GitStatus')

source ../helpers/status_teardown.vim
