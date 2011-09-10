" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>i :Rintegrationtest

" Rstep for step navigation
autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
" Rconfig for config navigation
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
