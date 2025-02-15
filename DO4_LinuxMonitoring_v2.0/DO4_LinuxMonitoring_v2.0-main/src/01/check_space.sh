#!/bin/bash
function check_space {
    # Проверка свободного места
    free_space=$(df --output=avail / | tail -n1)
    if [ $free_space -le 1048576 ]; then
        echo "Недостаточно свободного места. Осталось менее 1 Гб."
        exit 1
    fi
}
