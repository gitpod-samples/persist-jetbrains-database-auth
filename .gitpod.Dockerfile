FROM gitpod/workspace-base


SHELL ["/bin/bash", "-c"]
RUN <<EOR
set -eu
jb_dir="${HOME}/.gitpod/jetbrains"
jb_options_dir="${jb_dir}/options"
jdbc_drivers_dir="${jb_dir}/jdbc-drivers"
mkdir -m 0755 -p "${jb_options_dir}" "${jdbc_drivers_dir}"

# Download database driver dependencies
jars=(
 "https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar"
 "https://repo1.maven.org/maven2/org/checkerframework/checker-qual/3.42.0/checker-qual-3.42.0.jar"
)
  (
    cd "${jdbc_drivers_dir}"
    for jar in "${jars[@]}"; do {
      curl -LO "${jar}"
    } done
  )

databaseDrivers_xml="$(
  printf '%s\n' '<application>
          <component name="LocalDatabaseDriverManager" version="201">
            <driver id="postgresql">
              <artifact />'
  for f in "${jdbc_drivers_dir}"/*; do {
    printf '%s\n' "      <library>
                    <url>file://${f}</url>
                  </library>"
  } done

  printf '%s\n' '    </driver>
                   </component>
                 </application>'
)"
printf "%s\n" "${databaseDrivers_xml}" > "${jb_options_dir}/databaseDrivers.xml"

# For postgres, pgpass
## Format = hostname:port:database:username:password
## You can use wildcards (*) for any field except password
printf '%s\n' '*:*:*:*:mysecretpassword' > "${HOME}/.pgpass"

# This may work for other DBs too, commment it out if not needed. For postgres, pgpass is simpler
sudo tee -a /etc/bash.bashrc <<'BASH'

if test -v JETBRAINS_GITPOD_BACKEND_KIND && mkdir /tmp/.jdbc.lock 2>/dev/null; then
  (
#      until test -e /workspace/.gitpod/ready; do
#        sleep 1
#      done

      shopt -s nullglob
      until ides=(/workspace/.config/JetBrains/RemoteDevv-*) && test -n "${ides:-}"; do
        sleep 1
      done
      for ide in "${ides[@]}"; do
          for f in "${GITPOD_REPO_ROOT}/.idea/keepass"/*; do
            ln -sf "${f}" "${ide}"
          done
      done
  ) & disown
fi

BASH

EOR

