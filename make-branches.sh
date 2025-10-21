# Устанавливаем переменные (без комментариев!)
REMOTE="origin"
BRANCHES=("feature-auth" "ui-screens" "bugfix-crash" "docs-guide")
FILES_PER_BRANCH=(1 2 3 4)
COMMITS_PER_BRANCH=5

# Убедимся, что мы в master
git checkout master

# Цикл по веткам
for i in "${!BRANCHES[@]}"; do
    BRANCH="${BRANCHES[$i]}"
    FILE_COUNT="${FILES_PER_BRANCH[$i]}"
    
    # Создаём новую ветку из master
    git checkout -b "$BRANCH"
    
    # Делаем коммиты
    for ((c=1; c<=COMMITS_PER_BRANCH; c++)); do
        for ((f=1; f<=FILE_COUNT; f++)); do
            echo "Ветка: $BRANCH | Коммит: $c | Файл: $f" > "data_${BRANCH}_$f.txt"
        done
        git add .
        git commit -m "feat($BRANCH): commit $c with $FILE_COUNT files"
    done
    
    # Пушим ветку на GitHub
    git push "$REMOTE" "$BRANCH"
    echo "✅ Ветка $BRANCH успешно создана и запушена"
done

# Возвращаемся в master
git checkout master
echo "🎉 Задание №3 выполнено!"