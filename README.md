[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">

  <h3 align="center">TCP Scanner</h3>

  <p align="center">
    Simple 
    <br />
    <br />
    <a href="https://github.com/itasahobby/tcp_scanv2/issues">Report Bug</a>
    ·
    <a href="https://github.com/itasahobby/tcp_scanv2/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

The tool provides a simple TCP scanner to avoid retyping all the parameters on controlled environments such as CTFs.

### Built With

* [Furious](https://github.com/liamg/furious)
* [Nmap](https://github.com/nmap/nmap)


<!-- GETTING STARTED -->
## Getting Started

To install it run the following commands:

```sh
sudo apt install libpcap0.8-dev libcap-dev golang
go get -u github.com/liamg/furious
sudo wget https://raw.githubusercontent.com/itasahobby/tcp_scanv2/master/scan.sh -O /usr/bin/scan
sudo chmod +x /usr/bin/scan
```


<!-- USAGE EXAMPLES -->
## Usage

```
scan [OPTIONS]

main options are described below.

        Options:
                -v,--verbose Verbose output only showing nmap command without executing
                -t,--target Target to scan (mandatory)
                -p,--paranoic Slow scan
                -h,--help Display this help and exit
                --version Displays versions and exits
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/itasahobby/tcp_scanv2/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- CONTACT -->
## Contact

Your Name - [@jusepe_it](https://twitter.com/jusepe_it) - itasahobby@gmail.com

Project Link: [https://github.com/itasahobby/tcp_scanv2](https://github.com/itasahobby/tcp_scanv2)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [takito](https://twitter.com/takito1812)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/itasahobby/tcp_scanv2.svg?style=for-the-badge
[contributors-url]: https://github.com/itasahobby/tcp_scanv2/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/itasahobby/tcp_scanv2.svg?style=for-the-badge
[forks-url]: https://github.com/itasahobby/tcp_scanv2/network/members
[stars-shield]: https://img.shields.io/github/stars/itasahobby/tcp_scanv2.svg?style=for-the-badge
[stars-url]: https://github.com/itasahobby/tcp_scanv2/stargazers
[issues-shield]: https://img.shields.io/github/issues/itasahobby/tcp_scanv2.svg?style=for-the-badge
[issues-url]: https://github.com/itasahobby/tcp_scanv2/issues
