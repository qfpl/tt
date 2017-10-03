{ nixpkgs, declInput }: let pkgs = import nixpkgs {}; in {
  jobsets = pkgs.runCommand "spec.json" {} ''
    cat <<EOF
    ${builtins.toXML declInput}
    EOF
    cat > $out <<EOF
    {
        "tt": {
            "enabled": 1,
            "hidden": false,
            "description": "tt",
            "nixexprinput": "tt",
            "nixexprpath": "ci/ci.nix",
            "checkinterval": 300,
            "schedulingshares": 1,
            "enableemail": false,
            "emailoverride": "",
            "keepnr": 5,
            "inputs": {
                "tt": { "type": "git", "value": "https://github.com/qfpl/tt", "emailresponsible": false },
                "nixpkgs": { "type": "git", "value": "https://github.com/NixOS/nixpkgs.git release-17.03", "emailresponsible": false }
            }
        }
    }
    EOF
  '';
}
