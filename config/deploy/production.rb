server "13.112.237.89", user: "kanji", roles: %w{app db web}

set :ssh_options, {
  keys: %w(~/.ssh/aws_rm_graph.pem),
  forward_agent: true,
  auth_methods: %w(publickey),
}
