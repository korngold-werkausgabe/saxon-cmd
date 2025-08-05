## 🐳 Saxon CMD Docker Image v1.0.0

A lightweight Docker container for XSLT transformations and XQuery processing using Saxon-HE 12.5.

### 📦 Docker Images

This release is available on multiple registries:

- **Docker Hub**: [`diginaut/saxon-cmd:1.0.0`](https://hub.docker.com/r/diginaut/saxon-cmd)
- **GitHub Packages**: [`ghcr.io/korngold-werkausgabe/saxon-cmd:1.0.0`](https://github.com/korngold-werkausgabe/saxon-cmd/pkgs/container/saxon-cmd)

### 🚀 Quick Usage

#### Pull and Run from Docker Hub
```bash
# XSLT Transformation
docker run --rm -v /path/to/files:/app/input diginaut/saxon-cmd:1.0.0 xslt input.xml stylesheet.xsl

# XQuery Processing
docker run --rm -v /path/to/files:/app/input diginaut/saxon-cmd:1.0.0 xquery query.xq
```

#### Pull and Run from GitHub Packages
```bash
# XSLT Transformation
docker run --rm -v /path/to/files:/app/input ghcr.io/korngold-werkausgabe/saxon-cmd:1.0.0 xslt input.xml stylesheet.xsl

# XQuery Processing
docker run --rm -v /path/to/files:/app/input ghcr.io/korngold-werkausgabe/saxon-cmd:1.0.0 xquery query.xq
```

### ✨ Features

- ✅ **Saxon-HE 12.5**: Latest Saxon Home Edition
- ✅ **XSLT 3.0 Support**: Full XSLT transformation capabilities
- ✅ **XQuery 3.1 Support**: Advanced XML querying
- ✅ **Alpine Linux**: Minimal footprint (~300MB)
- ✅ **Easy Integration**: Perfect for CI/CD pipelines
- ✅ **Multi-platform**: Available for AMD64 and ARM64

### 📋 Requirements

- Docker 20.10+ or compatible container runtime
- Input XML files and XSLT/XQuery scripts
- Volume mapping for file access

### 🔄 Upgrade Notes

This is the initial release. No upgrade considerations needed.

### 🐛 Known Issues

None at this time.

### 📚 Documentation

Full documentation is available in the [README.md](https://github.com/korngold-werkausgabe/saxon-cmd/blob/main/README.md).

### 🤝 Contributing

Please read our [Code of Conduct](https://github.com/korngold-werkausgabe/saxon-cmd/blob/main/CODE_OF_CONDUCT.md) and see our [Contributing Guidelines](https://github.com/korngold-werkausgabe/saxon-cmd/blob/main/README.md#contributing).

### 📄 License

This project is licensed under the GNU GPLv3 License - see the [LICENSE](https://github.com/korngold-werkausgabe/saxon-cmd/blob/main/LICENSE) file for details.

### 🏷️ Citation

Please cite this software using our [CITATION.cff](https://github.com/korngold-werkausgabe/saxon-cmd/blob/main/CITATION.cff) file or use GitHub's "Cite this repository" feature.
