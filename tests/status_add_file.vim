" Test the options toggling using the ? key

source helpers/status_setup.vim
call StartTapWithPlan(3)

GitStatus

call vimtap#Like(BufferContent(), 'Untracked files:', 'There is at least one untracked file')

" Move to the last line and check that the file is right
normal G
call vimtap#Like(LineContent(), 'third_file.txt', 'The last line contains the untracked file')

" Add the untracked file
normal a
call vimtap#Unlike(BufferContent(), 'Untracked files:', 'There are no untracked files')

source ../helpers/status_teardown.vim
