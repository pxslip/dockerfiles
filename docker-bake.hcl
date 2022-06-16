variable "PHP_VERSION" {
  default = 8
}

target "laravel-devcontainer" {
  dockerfile = "laravel-devcontainer.dockerfile"
}