GEOMETRY_COLOR_DCOS=${GEOMETRY_COLOR_DCOS:-magenta}

GEOMETRY_SYMBOL_DCOS=${GEOMETRY_SYMBOL_DCOS:-"◩"}
GEOMETRY_DCOS=$(prompt_geometry_colorize $GEOMETRY_COLOR_DCOS $GEOMETRY_SYMBOL_DCOS)

prompt_geometry_dcos_cluster() {
  GEOMETRY_DCOS_CLUSTER="$(dcos cluster list --attached --json | jq -r '.[].name' 2> /dev/null)"
}

geometry_prompt_dcos_setup() {
  (( $+commands[dcos] )) || return 1
}

geometry_prompt_dcos_check() {
  [ -d "$HOME/.dcos" || -d "$DCOS_DIR" ] || return 1
}

geometry_prompt_dcos_render() {
  prompt_geometry_dcos_cluster

  echo "$GEOMETRY_DCOS $GEOMETRY_DCOS_CLUSTER"
}

geometry_plugin_register dcos
