namespace :migration do
    task git_command: :environment do
        p 'a' * 500
        sh "git init"
        sh "git checkout -b new-branch-2"
        sh "git push -u origin new-branch-2"
        sh "git add ."
        sh "git commit -m 'added new locale' --no-verify"
        sh "git push -u origin new-branch-2"
    end
end