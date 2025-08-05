# Saxon CMD Docker Image

[![Docker Hub](https://img.shields.io/docker/v/diginaut/saxon-cmd?label=Docker%20Hub)](https://hub.docker.com/r/diginaut/saxon-cmd)
[![Docker Image Size](https://img.shields.io/docker/image-size/diginaut/saxon-cmd)](https://hub.docker.com/r/diginaut/saxon-cmd)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A lightweight Docker image for executing XSLT transformations and XQuery scripts using Saxon-HE (Home Edition). This container provides a simple command-line interface for processing XML documents with Saxon's powerful transformation capabilities.

## Features

- **Saxon-HE 12.5**: Latest Saxon Home Edition for XSLT and XQuery processing
- **XSLT Support**: Execute XSLT transformations with XML input and stylesheet files
- **XQuery Support**: Run XQuery scripts for advanced XML querying and transformation
- **Lightweight**: Based on Alpine Linux for minimal footprint
- **Easy Integration**: Simple Docker commands for CI/CD pipelines and automated workflows

## Quick Start

### Pre-built Docker Image (Recommended)

The easiest way to use Saxon CMD is by pulling the pre-built image from Docker Hub:

```bash
# Pull the latest version
docker pull diginaut/saxon-cmd:latest

# Or pull a specific version
docker pull diginaut/saxon-cmd:1.0.0
```

### Building the Image Locally

Alternatively, you can build the image yourself:

```bash
docker build -t saxon-cmd .
```

### Basic Usage

#### Using Pre-built Image

**XSLT Transformation:**
Transform an XML document using an XSLT stylesheet:

```bash
docker run --rm -v /path/to/your/files:/app/input diginaut/saxon-cmd:latest xslt input.xml stylesheet.xsl
```

**XQuery Script:**
Execute an XQuery script:

```bash
docker run --rm -v /path/to/your/files:/app/input diginaut/saxon-cmd:latest xquery query.xq
```

#### Using Locally Built Image

**XSLT Transformation:**

```bash
docker run --rm \
  -v $(pwd)/input:/input \
  -v $(pwd)/output:/output \
  saxon-cmd xslt /input/input.xml /input/stylesheet.xsl /output/result.html
```

#### XQuery Processing

Execute an XQuery script:

```bash
docker run --rm \
  -v $(pwd)/input:/input \
  -v $(pwd)/output:/output \
  saxon-cmd xquery /input/query.xq /output/result.xml
```

## Advanced Usage

### Using Environment Variables

You can also specify the mode using environment variables:

```bash
# XSLT mode
docker run --rm \
  -e MODE=xslt \
  -v $(pwd)/input:/input \
  -v $(pwd)/output:/output \
  saxon-cmd /input/input.xml /input/stylesheet.xsl /output/result.html

# XQuery mode
docker run --rm \
  -e MODE=xquery \
  -v $(pwd)/input:/input \
  -v $(pwd)/output:/output \
  saxon-cmd /input/query.xq /output/result.xml
```

### Docker Compose

Create a `docker-compose.yml` for easier management:

```yaml
version: '3.8'
services:
  saxon-xslt:
    build: .
    volumes:
      - ./input:/input
      - ./output:/output
    command: ["xslt", "/input/input.xml", "/input/stylesheet.xsl", "/output/result.html"]
  
  saxon-xquery:
    build: .
    volumes:
      - ./input:/input
      - ./output:/output
    command: ["xquery", "/input/query.xq", "/output/result.xml"]
```
## Requirements

- Docker Engine 20.10 or later
- Input XML files and XSLT/XQuery scripts

## Contributing

Please read our [Code of Conduct](CODE_OF_CONDUCT.md) before contributing.

## Licence

This project is licensed under the GNU GPLv3 License - see the [LICENSE](LICENSE) file for details.

## Citation

Please cite this software using the information provided in the [CITATION.cff](CITATION.cff) file. You can also use GitHub's "Cite this repository" feature on the repository page.