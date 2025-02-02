{ lib
, buildPythonPackage
, fetchFromGitHub
, prompt-toolkit
, pythonOlder
, winacl
}:

buildPythonPackage rec {
  pname = "aiowinreg";
  version = "0.0.8";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "skelsec";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-4/xElE70rJKBMS1HdHb6BlcKs4gzNfuEo/6ahN6ixSM=";
  };

  propagatedBuildInputs = [
    prompt-toolkit
    winacl
  ];

  # Project doesn't have tests
  doCheck = false;

  pythonImportsCheck = [
    "aiowinreg"
  ];

  meta = with lib; {
    description = "Python module to parse the registry hive";
    homepage = "https://github.com/skelsec/aiowinreg";
    changelog = "https://github.com/skelsec/aiowinreg/releases/tag/${version}";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
