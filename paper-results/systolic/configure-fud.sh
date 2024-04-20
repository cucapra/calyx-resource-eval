stage_name=${1:-'calyx'}
commit_hash=${2:-'master'}

if [ ! -d "calyx" ]
then
    >&2 echo "Cloning calyx"
    git clone git@github.com:cucapra/calyx.git
fi

cd calyx
git checkout master
git pull
git checkout $commit_hash
cargo build

## Check if flit is installed
if ! command -v flit &> /dev/null
then
    >&2 echo "Flit is not installed. Installing..."
    python3 -m pip install flit
fi

# Install fud, since this is the installation we want to use (not my other fud installation on another Calyx repo)
>&2 echo "Installing fud..."
cd fud && flit install -s && cd ../

fud config global.root "$(pwd)"
fud config stages.$stage_name.exec "$(pwd)/target/debug/$stage_name"
