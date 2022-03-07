#!/bin/bash

echo "Do you want to tech out ; 'y'/ 'n'/ 'q'"

read answer

    case $answer in

        y)

            echo "y for yes, you want to tech out"

            ;;

        n)

            echo "n for no, you don't want to tech out"

            ;;

        q)

            echo "q for quit, quiting"

            ;;

        *)

            echo "That is not a valid option"

            sleep 3

            ;;

        esac
