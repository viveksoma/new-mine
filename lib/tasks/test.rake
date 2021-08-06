namespace :migration do
    task git_command: :environment do
        p 'a' * 500
        sh "git init"
        sh "git checkout -b new-branch-4"
        sh "git push -u origin new-branch-4"
        sh "git add ."
        sh "git commit -m 'added new locale' --no-verify"
        sh "git push -u origin new-branch-4"

        headers = {
        'User-Agent' => 'Awesome-Octocat-App',
        'Authorization' => "Bearer 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",
        'Accept' => 'application/vnd.github.v3+json'
        }
        base_uri = "https://api.github.com"
        tree_params = {"head":"new-branch-4","base":"main", "title": "localise"}.to_json
        tree_url = "https://api.github.com/repos/viveksoma/new-mine/pulls"
        p 'a' * 500
        response = HTTParty.post(tree_url, headers: headers, body: tree_params )
        p response
        # sh 'git request-pull "origin/main" "new-branch-3"'
    end
end
