brew=false


if [[ $* == *--brew* ]]
then
    brew=true
fi

if [ $brew == true ]; then
    echo 'gonna brew'
fi