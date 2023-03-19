# neggles/helm-charts

[![Release Charts](https://github.com/neggles/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/neggles/helm-charts/actions/workflows/release.yaml)
[![Publish Charts](https://github.com/neggles/helm-charts/actions/workflows/pages/pages-build-deployment/badge.svg?branch=gh-pages)](https://github.com/neggles/helm-charts/actions/workflows/pages/pages-build-deployment)

This repository contains helm charts I've put together for an assortment of services, mostly for
my own use. Some are modified/improved/fixed versions of other charts, some are original, some are
a bit of both.

Use at own risk! This mostly exists so I can use it as a HelmRepository with `flux`; things may
be broken and are unlikely to really be tested much (if at all).

If you're fine with that, then...

## Usage

You're going to need [Helm](https://helm.sh) for this, shockingly enough.
If you've made it this far despite the above warning, and somehow *don't* already have Helm,
go read the Helm [documentation](https://helm.sh/docs) to get it set up. 

~~Then perhaps reconsider using my charts for your first-ever deployment...~~

Once Helm has been set up, add the repo:

```sh
helm repo add neggles https://neggles.github.io/helm-charts
```

You can do this to see what charts are available:

```sh
helm search repo neggles
```

Say you want to install the `error-pages` chart;

```
helm install my-error-pages neggles/error-pages
```

Once you're making better decisions, remove it:

```
helm delete my-error-pages
```

Have fun???
