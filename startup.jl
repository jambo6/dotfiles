ENV["JULIA_NUM_THREADS"] = 8
ENV["EDITOR"] = "vim"
ENV["PYTHON"] = "python"

# Setup OhMyREPL and Revise
import Pkg
let
    pkgs = ["Revise", "OhMyREPL"]
    for pkg in pkgs
    if Base.find_package(pkg) === nothing
        Pkg.add(pkg)
    end
    end
end

using Revise
using OhMyREPL
