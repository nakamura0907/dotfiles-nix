{ pkgs, lib, ... }: {
  home.packages =
    with pkgs;
    lib.optionals stdenv.isDarwin [
      colima
      docker-client
    ]
    ++ lib.optionals stdenv.isLinux [
      docker
      docker-compose
    ];

  launchd.agents.colima = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    config = {
      Label = "colima";
      ProgramArguments = [
        "${pkgs.colima}/bin/colima"
        "start"
      ];
      RunAtLoad = true;
      StandardOutPath = "/tmp/colima.log";
      StandardErrorPath = "/tmp/colima.log";
    };
  };
}
