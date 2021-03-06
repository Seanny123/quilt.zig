# $Id: setup.sh.example,v 1.7 2014/08/18 09:02:46 philip Exp $

# File to be sourced (not executed!) to ease compilation (not required
# for installation). The default will do when it's being read in its own
# directory. Copy and adjust.  
BUILD_HOME=`pwd` 
export BUILD_HOME

# quilt will be installed in directory $bindir (/usr/local/bin by default, see 
# makefile.include), make sure it's in your $PATH

# where to search for pdb files (colon-separated list of directories)
export PDBPATH=.:..:/data/local/pdb
# (PDB files should look like 3fxn.pdb, i.e. code followed by '.pdb'. If you
# don't like it, tweak PDBSUFFIX in utils/pdb.h and recompile)


# 
### convenience function to keep additions to PATH clean
path_prepend() {
    local var=$1
    local val=${!var}
    local new=$2
    if [ x$val = x ] ; then
        export "$var"="$new"
    else
        local val2=":$val:"
        if [ x${val2/:$new:} = x${val2} ] ; then
            export "$var"="$new:$val"
        fi
    fi
}

# where to find quilt binary (should match $(bindir) in  makefile.include):
quilt_path=/usr/local/bin


path_prepend PATH $quilt_path
