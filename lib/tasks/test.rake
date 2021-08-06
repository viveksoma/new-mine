namespace :migration do
    task git_command: :environment do
        p 'a' * 500
        sh "git init"
        sh "git checkout -b new-branch-3"
        sh "git push -u origin new-branch-3"
        sh "git add ."
        sh "git commit -m 'added new locale' --no-verify"
        sh "git push -u origin new-branch-3"
        sh 'git request-pull "origin/main" "new-branch-3"'
    end
end
