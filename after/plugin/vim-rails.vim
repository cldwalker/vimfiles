" Leader shortcuts for Rails commands
map <Leader>rm :Rmodel
map <Leader>rc :Rcontroller
map <Leader>rv :Rview
map <Leader>ru :Runittest
map <Leader>rC :Rfunctionaltest
map <Leader>ri :Rintegrationtest

" Rstep for step navigation
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
" Rconfig for config navigation
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
