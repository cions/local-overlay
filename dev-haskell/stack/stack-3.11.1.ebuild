# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit edo flag-o-matic multiprocessing shell-completion

DESCRIPTION="The Haskell Tool Stack"
HOMEPAGE="https://haskellstack.org/"
SRC_URI="
	https://github.com/commercialhaskell/stack/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://hackage.haskell.org/package/aeson-2.2.4.1/aeson-2.2.4.1.tar.gz
	https://hackage.haskell.org/package/aeson-2.2.4.1/revision/0.cabal -> aeson-2.2.4.1.cabal
	https://hackage.haskell.org/package/aeson-warning-parser-0.1.1/aeson-warning-parser-0.1.1.tar.gz
	https://hackage.haskell.org/package/aeson-warning-parser-0.1.1/revision/0.cabal -> aeson-warning-parser-0.1.1.cabal
	https://hackage.haskell.org/package/annotated-wl-pprint-0.7.0/annotated-wl-pprint-0.7.0.tar.gz
	https://hackage.haskell.org/package/annotated-wl-pprint-0.7.0/revision/1.cabal -> annotated-wl-pprint-0.7.0.cabal
	https://hackage.haskell.org/package/ansi-terminal-1.1.5/ansi-terminal-1.1.5.tar.gz
	https://hackage.haskell.org/package/ansi-terminal-1.1.5/revision/0.cabal -> ansi-terminal-1.1.5.cabal
	https://hackage.haskell.org/package/ansi-terminal-types-1.1.3/ansi-terminal-types-1.1.3.tar.gz
	https://hackage.haskell.org/package/ansi-terminal-types-1.1.3/revision/0.cabal -> ansi-terminal-types-1.1.3.cabal
	https://hackage.haskell.org/package/appar-0.1.8/appar-0.1.8.tar.gz
	https://hackage.haskell.org/package/appar-0.1.8/revision/0.cabal -> appar-0.1.8.cabal
	https://hackage.haskell.org/package/assoc-1.1.1/assoc-1.1.1.tar.gz
	https://hackage.haskell.org/package/assoc-1.1.1/revision/2.cabal -> assoc-1.1.1.cabal
	https://hackage.haskell.org/package/async-2.2.6/async-2.2.6.tar.gz
	https://hackage.haskell.org/package/async-2.2.6/revision/0.cabal -> async-2.2.6.cabal
	https://hackage.haskell.org/package/atomic-counter-0.1.2.4/atomic-counter-0.1.2.4.tar.gz
	https://hackage.haskell.org/package/atomic-counter-0.1.2.4/revision/0.cabal -> atomic-counter-0.1.2.4.cabal
	https://hackage.haskell.org/package/attoparsec-0.14.4/attoparsec-0.14.4.tar.gz
	https://hackage.haskell.org/package/attoparsec-0.14.4/revision/6.cabal -> attoparsec-0.14.4.cabal
	https://hackage.haskell.org/package/attoparsec-aeson-2.2.2.0/attoparsec-aeson-2.2.2.0.tar.gz
	https://hackage.haskell.org/package/attoparsec-aeson-2.2.2.0/revision/1.cabal -> attoparsec-aeson-2.2.2.0.cabal
	https://hackage.haskell.org/package/auto-update-0.2.6/auto-update-0.2.6.tar.gz
	https://hackage.haskell.org/package/auto-update-0.2.6/revision/0.cabal -> auto-update-0.2.6.cabal
	https://hackage.haskell.org/package/base16-1.0/base16-1.0.tar.gz
	https://hackage.haskell.org/package/base16-1.0/revision/4.cabal -> base16-1.0.cabal
	https://hackage.haskell.org/package/base16-bytestring-1.0.2.0/base16-bytestring-1.0.2.0.tar.gz
	https://hackage.haskell.org/package/base16-bytestring-1.0.2.0/revision/1.cabal -> base16-bytestring-1.0.2.0.cabal
	https://hackage.haskell.org/package/base64-1.0/base64-1.0.tar.gz
	https://hackage.haskell.org/package/base64-1.0/revision/3.cabal -> base64-1.0.cabal
	https://hackage.haskell.org/package/base64-bytestring-1.2.1.0/base64-bytestring-1.2.1.0.tar.gz
	https://hackage.haskell.org/package/base64-bytestring-1.2.1.0/revision/1.cabal -> base64-bytestring-1.2.1.0.cabal
	https://hackage.haskell.org/package/basement-0.0.16/basement-0.0.16.tar.gz
	https://hackage.haskell.org/package/basement-0.0.16/revision/0.cabal -> basement-0.0.16.cabal
	https://hackage.haskell.org/package/base-orphans-0.9.4/base-orphans-0.9.4.tar.gz
	https://hackage.haskell.org/package/base-orphans-0.9.4/revision/0.cabal -> base-orphans-0.9.4.cabal
	https://hackage.haskell.org/package/bifunctors-5.6.3/bifunctors-5.6.3.tar.gz
	https://hackage.haskell.org/package/bifunctors-5.6.3/revision/1.cabal -> bifunctors-5.6.3.cabal
	https://hackage.haskell.org/package/bitvec-1.1.6.0/bitvec-1.1.6.0.tar.gz
	https://hackage.haskell.org/package/bitvec-1.1.6.0/revision/0.cabal -> bitvec-1.1.6.0.cabal
	https://hackage.haskell.org/package/blaze-builder-0.4.4.1/blaze-builder-0.4.4.1.tar.gz
	https://hackage.haskell.org/package/blaze-builder-0.4.4.1/revision/0.cabal -> blaze-builder-0.4.4.1.cabal
	https://hackage.haskell.org/package/blaze-html-0.9.2.0/blaze-html-0.9.2.0.tar.gz
	https://hackage.haskell.org/package/blaze-html-0.9.2.0/revision/1.cabal -> blaze-html-0.9.2.0.cabal
	https://hackage.haskell.org/package/blaze-markup-0.8.3.0/blaze-markup-0.8.3.0.tar.gz
	https://hackage.haskell.org/package/blaze-markup-0.8.3.0/revision/2.cabal -> blaze-markup-0.8.3.0.cabal
	https://hackage.haskell.org/package/byteorder-1.0.4/byteorder-1.0.4.tar.gz
	https://hackage.haskell.org/package/byteorder-1.0.4/revision/0.cabal -> byteorder-1.0.4.cabal
	https://hackage.haskell.org/package/casa-client-0.0.4/casa-client-0.0.4.tar.gz
	https://hackage.haskell.org/package/casa-client-0.0.4/revision/0.cabal -> casa-client-0.0.4.cabal
	https://hackage.haskell.org/package/casa-types-0.0.3/casa-types-0.0.3.tar.gz
	https://hackage.haskell.org/package/casa-types-0.0.3/revision/0.cabal -> casa-types-0.0.3.cabal
	https://hackage.haskell.org/package/case-insensitive-1.2.1.0/case-insensitive-1.2.1.0.tar.gz
	https://hackage.haskell.org/package/case-insensitive-1.2.1.0/revision/0.cabal -> case-insensitive-1.2.1.0.cabal
	https://hackage.haskell.org/package/cborg-0.2.10.0/cborg-0.2.10.0.tar.gz
	https://hackage.haskell.org/package/cborg-0.2.10.0/revision/3.cabal -> cborg-0.2.10.0.cabal
	https://hackage.haskell.org/package/cereal-0.5.8.3/cereal-0.5.8.3.tar.gz
	https://hackage.haskell.org/package/cereal-0.5.8.3/revision/0.cabal -> cereal-0.5.8.3.cabal
	https://hackage.haskell.org/package/character-ps-0.1/character-ps-0.1.tar.gz
	https://hackage.haskell.org/package/character-ps-0.1/revision/0.cabal -> character-ps-0.1.cabal
	https://hackage.haskell.org/package/clock-0.8.4/clock-0.8.4.tar.gz
	https://hackage.haskell.org/package/clock-0.8.4/revision/0.cabal -> clock-0.8.4.cabal
	https://hackage.haskell.org/package/cmdargs-0.10.22/cmdargs-0.10.22.tar.gz
	https://hackage.haskell.org/package/cmdargs-0.10.22/revision/0.cabal -> cmdargs-0.10.22.cabal
	https://hackage.haskell.org/package/colour-2.3.7/colour-2.3.7.tar.gz
	https://hackage.haskell.org/package/colour-2.3.7/revision/0.cabal -> colour-2.3.7.cabal
	https://hackage.haskell.org/package/comonad-5.0.10/comonad-5.0.10.tar.gz
	https://hackage.haskell.org/package/comonad-5.0.10/revision/0.cabal -> comonad-5.0.10.cabal
	https://hackage.haskell.org/package/companion-0.1.0/companion-0.1.0.tar.gz
	https://hackage.haskell.org/package/companion-0.1.0/revision/0.cabal -> companion-0.1.0.cabal
	https://hackage.haskell.org/package/conduit-1.3.6.1/conduit-1.3.6.1.tar.gz
	https://hackage.haskell.org/package/conduit-1.3.6.1/revision/0.cabal -> conduit-1.3.6.1.cabal
	https://hackage.haskell.org/package/conduit-combinators-1.3.0/conduit-combinators-1.3.0.tar.gz
	https://hackage.haskell.org/package/conduit-combinators-1.3.0/revision/0.cabal -> conduit-combinators-1.3.0.cabal
	https://hackage.haskell.org/package/conduit-extra-1.3.8/conduit-extra-1.3.8.tar.gz
	https://hackage.haskell.org/package/conduit-extra-1.3.8/revision/1.cabal -> conduit-extra-1.3.8.cabal
	https://hackage.haskell.org/package/contravariant-1.5.6/contravariant-1.5.6.tar.gz
	https://hackage.haskell.org/package/contravariant-1.5.6/revision/0.cabal -> contravariant-1.5.6.cabal
	https://hackage.haskell.org/package/cookie-0.5.1/cookie-0.5.1.tar.gz
	https://hackage.haskell.org/package/cookie-0.5.1/revision/0.cabal -> cookie-0.5.1.cabal
	https://hackage.haskell.org/package/cryptohash-sha256-0.11.102.1/cryptohash-sha256-0.11.102.1.tar.gz
	https://hackage.haskell.org/package/cryptohash-sha256-0.11.102.1/revision/6.cabal -> cryptohash-sha256-0.11.102.1.cabal
	https://hackage.haskell.org/package/crypton-1.0.6/crypton-1.0.6.tar.gz
	https://hackage.haskell.org/package/crypton-1.0.6/revision/0.cabal -> crypton-1.0.6.cabal
	https://hackage.haskell.org/package/crypton-asn1-encoding-0.10.0/crypton-asn1-encoding-0.10.0.tar.gz
	https://hackage.haskell.org/package/crypton-asn1-encoding-0.10.0/revision/0.cabal -> crypton-asn1-encoding-0.10.0.cabal
	https://hackage.haskell.org/package/crypton-asn1-parse-0.10.0/crypton-asn1-parse-0.10.0.tar.gz
	https://hackage.haskell.org/package/crypton-asn1-parse-0.10.0/revision/0.cabal -> crypton-asn1-parse-0.10.0.cabal
	https://hackage.haskell.org/package/crypton-asn1-types-0.4.1/crypton-asn1-types-0.4.1.tar.gz
	https://hackage.haskell.org/package/crypton-asn1-types-0.4.1/revision/0.cabal -> crypton-asn1-types-0.4.1.cabal
	https://hackage.haskell.org/package/crypton-conduit-0.2.3/crypton-conduit-0.2.3.tar.gz
	https://hackage.haskell.org/package/crypton-conduit-0.2.3/revision/1.cabal -> crypton-conduit-0.2.3.cabal
	https://hackage.haskell.org/package/crypton-connection-0.4.5/crypton-connection-0.4.5.tar.gz
	https://hackage.haskell.org/package/crypton-connection-0.4.5/revision/1.cabal -> crypton-connection-0.4.5.cabal
	https://hackage.haskell.org/package/crypton-pem-0.3.0/crypton-pem-0.3.0.tar.gz
	https://hackage.haskell.org/package/crypton-pem-0.3.0/revision/0.cabal -> crypton-pem-0.3.0.cabal
	https://hackage.haskell.org/package/crypton-socks-0.6.2/crypton-socks-0.6.2.tar.gz
	https://hackage.haskell.org/package/crypton-socks-0.6.2/revision/0.cabal -> crypton-socks-0.6.2.cabal
	https://hackage.haskell.org/package/crypton-x509-1.8.0/crypton-x509-1.8.0.tar.gz
	https://hackage.haskell.org/package/crypton-x509-1.8.0/revision/1.cabal -> crypton-x509-1.8.0.cabal
	https://hackage.haskell.org/package/crypton-x509-store-1.8.0/crypton-x509-store-1.8.0.tar.gz
	https://hackage.haskell.org/package/crypton-x509-store-1.8.0/revision/0.cabal -> crypton-x509-store-1.8.0.cabal
	https://hackage.haskell.org/package/crypton-x509-system-1.8.0/crypton-x509-system-1.8.0.tar.gz
	https://hackage.haskell.org/package/crypton-x509-system-1.8.0/revision/0.cabal -> crypton-x509-system-1.8.0.cabal
	https://hackage.haskell.org/package/crypton-x509-validation-1.8.0/crypton-x509-validation-1.8.0.tar.gz
	https://hackage.haskell.org/package/crypton-x509-validation-1.8.0/revision/1.cabal -> crypton-x509-validation-1.8.0.cabal
	https://hackage.haskell.org/package/data-default-0.8.0.2/data-default-0.8.0.2.tar.gz
	https://hackage.haskell.org/package/data-default-0.8.0.2/revision/0.cabal -> data-default-0.8.0.2.cabal
	https://hackage.haskell.org/package/data-default-class-0.2.0.0/data-default-class-0.2.0.0.tar.gz
	https://hackage.haskell.org/package/data-default-class-0.2.0.0/revision/0.cabal -> data-default-class-0.2.0.0.cabal
	https://hackage.haskell.org/package/data-fix-0.3.4/data-fix-0.3.4.tar.gz
	https://hackage.haskell.org/package/data-fix-0.3.4/revision/2.cabal -> data-fix-0.3.4.cabal
	https://hackage.haskell.org/package/digest-0.0.2.1/digest-0.0.2.1.tar.gz
	https://hackage.haskell.org/package/digest-0.0.2.1/revision/0.cabal -> digest-0.0.2.1.cabal
	https://hackage.haskell.org/package/directory-ospath-streaming-0.3/directory-ospath-streaming-0.3.tar.gz
	https://hackage.haskell.org/package/directory-ospath-streaming-0.3/revision/1.cabal -> directory-ospath-streaming-0.3.cabal
	https://hackage.haskell.org/package/distributive-0.6.3/distributive-0.6.3.tar.gz
	https://hackage.haskell.org/package/distributive-0.6.3/revision/0.cabal -> distributive-0.6.3.cabal
	https://hackage.haskell.org/package/dlist-1.0/dlist-1.0.tar.gz
	https://hackage.haskell.org/package/dlist-1.0/revision/2.cabal -> dlist-1.0.cabal
	https://hackage.haskell.org/package/easy-file-0.2.5/easy-file-0.2.5.tar.gz
	https://hackage.haskell.org/package/easy-file-0.2.5/revision/0.cabal -> easy-file-0.2.5.cabal
	https://hackage.haskell.org/package/ech-config-0.0.1/ech-config-0.0.1.tar.gz
	https://hackage.haskell.org/package/ech-config-0.0.1/revision/1.cabal -> ech-config-0.0.1.cabal
	https://hackage.haskell.org/package/echo-0.1.4/echo-0.1.4.tar.gz
	https://hackage.haskell.org/package/echo-0.1.4/revision/0.cabal -> echo-0.1.4.cabal
	https://hackage.haskell.org/package/ed25519-0.0.5.0/ed25519-0.0.5.0.tar.gz
	https://hackage.haskell.org/package/ed25519-0.0.5.0/revision/9.cabal -> ed25519-0.0.5.0.cabal
	https://hackage.haskell.org/package/extra-1.8.1/extra-1.8.1.tar.gz
	https://hackage.haskell.org/package/extra-1.8.1/revision/0.cabal -> extra-1.8.1.cabal
	https://hackage.haskell.org/package/fast-logger-3.2.6/fast-logger-3.2.6.tar.gz
	https://hackage.haskell.org/package/fast-logger-3.2.6/revision/0.cabal -> fast-logger-3.2.6.cabal
	https://hackage.haskell.org/package/file-embed-0.0.16.0/file-embed-0.0.16.0.tar.gz
	https://hackage.haskell.org/package/file-embed-0.0.16.0/revision/0.cabal -> file-embed-0.0.16.0.cabal
	https://hackage.haskell.org/package/filelock-0.1.1.9/filelock-0.1.1.9.tar.gz
	https://hackage.haskell.org/package/filelock-0.1.1.9/revision/0.cabal -> filelock-0.1.1.9.cabal
	https://hackage.haskell.org/package/fsnotify-0.4.4.0/fsnotify-0.4.4.0.tar.gz
	https://hackage.haskell.org/package/fsnotify-0.4.4.0/revision/0.cabal -> fsnotify-0.4.4.0.cabal
	https://hackage.haskell.org/package/generic-deriving-1.14.7/generic-deriving-1.14.7.tar.gz
	https://hackage.haskell.org/package/generic-deriving-1.14.7/revision/0.cabal -> generic-deriving-1.14.7.cabal
	https://hackage.haskell.org/package/Glob-0.10.2/Glob-0.10.2.tar.gz
	https://hackage.haskell.org/package/Glob-0.10.2/revision/3.cabal -> Glob-0.10.2.cabal
	https://hackage.haskell.org/package/hackage-security-0.6.3.2/hackage-security-0.6.3.2.tar.gz
	https://hackage.haskell.org/package/hackage-security-0.6.3.2/revision/2.cabal -> hackage-security-0.6.3.2.cabal
	https://hackage.haskell.org/package/half-0.3.3/half-0.3.3.tar.gz
	https://hackage.haskell.org/package/half-0.3.3/revision/3.cabal -> half-0.3.3.cabal
	https://hackage.haskell.org/package/happy-2.2/happy-2.2.tar.gz
	https://hackage.haskell.org/package/happy-2.2/revision/0.cabal -> happy-2.2.cabal
	https://hackage.haskell.org/package/happy-lib-2.2/happy-lib-2.2.tar.gz
	https://hackage.haskell.org/package/happy-lib-2.2/revision/0.cabal -> happy-lib-2.2.cabal
	https://hackage.haskell.org/package/hashable-1.5.1.0/hashable-1.5.1.0.tar.gz
	https://hackage.haskell.org/package/hashable-1.5.1.0/revision/0.cabal -> hashable-1.5.1.0.cabal
	https://hackage.haskell.org/package/haskell-src-exts-1.23.1/haskell-src-exts-1.23.1.tar.gz
	https://hackage.haskell.org/package/haskell-src-exts-1.23.1/revision/0.cabal -> haskell-src-exts-1.23.1.cabal
	https://hackage.haskell.org/package/haskell-src-meta-0.8.15/haskell-src-meta-0.8.15.tar.gz
	https://hackage.haskell.org/package/haskell-src-meta-0.8.15/revision/1.cabal -> haskell-src-meta-0.8.15.cabal
	https://hackage.haskell.org/package/hi-file-parser-0.1.8.0/hi-file-parser-0.1.8.0.tar.gz
	https://hackage.haskell.org/package/hi-file-parser-0.1.8.0/revision/0.cabal -> hi-file-parser-0.1.8.0.cabal
	https://hackage.haskell.org/package/hinotify-0.4.2/hinotify-0.4.2.tar.gz
	https://hackage.haskell.org/package/hinotify-0.4.2/revision/0.cabal -> hinotify-0.4.2.cabal
	https://hackage.haskell.org/package/hpack-0.39.5/hpack-0.39.5.tar.gz
	https://hackage.haskell.org/package/hpack-0.39.5/revision/0.cabal -> hpack-0.39.5.cabal
	https://hackage.haskell.org/package/hpke-0.0.0/hpke-0.0.0.tar.gz
	https://hackage.haskell.org/package/hpke-0.0.0/revision/1.cabal -> hpke-0.0.0.cabal
	https://hackage.haskell.org/package/hsc2hs-0.68.10/hsc2hs-0.68.10.tar.gz
	https://hackage.haskell.org/package/hsc2hs-0.68.10/revision/5.cabal -> hsc2hs-0.68.10.cabal
	https://hackage.haskell.org/package/http-api-data-0.7/http-api-data-0.7.tar.gz
	https://hackage.haskell.org/package/http-api-data-0.7/revision/1.cabal -> http-api-data-0.7.cabal
	https://hackage.haskell.org/package/http-client-0.7.19/http-client-0.7.19.tar.gz
	https://hackage.haskell.org/package/http-client-0.7.19/revision/0.cabal -> http-client-0.7.19.cabal
	https://hackage.haskell.org/package/http-client-tls-0.3.6.4/http-client-tls-0.3.6.4.tar.gz
	https://hackage.haskell.org/package/http-client-tls-0.3.6.4/revision/3.cabal -> http-client-tls-0.3.6.4.cabal
	https://hackage.haskell.org/package/http-conduit-2.3.9.1/http-conduit-2.3.9.1.tar.gz
	https://hackage.haskell.org/package/http-conduit-2.3.9.1/revision/1.cabal -> http-conduit-2.3.9.1.cabal
	https://hackage.haskell.org/package/http-download-0.2.1.0/http-download-0.2.1.0.tar.gz
	https://hackage.haskell.org/package/http-download-0.2.1.0/revision/0.cabal -> http-download-0.2.1.0.cabal
	https://hackage.haskell.org/package/http-types-0.12.4/http-types-0.12.4.tar.gz
	https://hackage.haskell.org/package/http-types-0.12.4/revision/1.cabal -> http-types-0.12.4.cabal
	https://hackage.haskell.org/package/indexed-traversable-0.1.4/indexed-traversable-0.1.4.tar.gz
	https://hackage.haskell.org/package/indexed-traversable-0.1.4/revision/2.cabal -> indexed-traversable-0.1.4.cabal
	https://hackage.haskell.org/package/indexed-traversable-instances-0.1.2.1/indexed-traversable-instances-0.1.2.1.tar.gz
	https://hackage.haskell.org/package/indexed-traversable-instances-0.1.2.1/revision/0.cabal -> indexed-traversable-instances-0.1.2.1.cabal
	https://hackage.haskell.org/package/infer-license-0.2.0/infer-license-0.2.0.tar.gz
	https://hackage.haskell.org/package/infer-license-0.2.0/revision/0.cabal -> infer-license-0.2.0.cabal
	https://hackage.haskell.org/package/integer-conversion-0.1.1/integer-conversion-0.1.1.tar.gz
	https://hackage.haskell.org/package/integer-conversion-0.1.1/revision/2.cabal -> integer-conversion-0.1.1.cabal
	https://hackage.haskell.org/package/integer-logarithms-1.0.5/integer-logarithms-1.0.5.tar.gz
	https://hackage.haskell.org/package/integer-logarithms-1.0.5/revision/0.cabal -> integer-logarithms-1.0.5.cabal
	https://hackage.haskell.org/package/iproute-1.7.15/iproute-1.7.15.tar.gz
	https://hackage.haskell.org/package/iproute-1.7.15/revision/0.cabal -> iproute-1.7.15.cabal
	https://hackage.haskell.org/package/libyaml-0.1.4/libyaml-0.1.4.tar.gz
	https://hackage.haskell.org/package/libyaml-0.1.4/revision/0.cabal -> libyaml-0.1.4.cabal
	https://hackage.haskell.org/package/libyaml-clib-0.2.5/libyaml-clib-0.2.5.tar.gz
	https://hackage.haskell.org/package/libyaml-clib-0.2.5/revision/0.cabal -> libyaml-clib-0.2.5.cabal
	https://hackage.haskell.org/package/lifted-base-0.2.3.12/lifted-base-0.2.3.12.tar.gz
	https://hackage.haskell.org/package/lifted-base-0.2.3.12/revision/0.cabal -> lifted-base-0.2.3.12.cabal
	https://hackage.haskell.org/package/lift-type-0.1.2.0/lift-type-0.1.2.0.tar.gz
	https://hackage.haskell.org/package/lift-type-0.1.2.0/revision/0.cabal -> lift-type-0.1.2.0.cabal
	https://hackage.haskell.org/package/megaparsec-9.7.0/megaparsec-9.7.0.tar.gz
	https://hackage.haskell.org/package/megaparsec-9.7.0/revision/1.cabal -> megaparsec-9.7.0.cabal
	https://hackage.haskell.org/package/memory-0.18.0/memory-0.18.0.tar.gz
	https://hackage.haskell.org/package/memory-0.18.0/revision/1.cabal -> memory-0.18.0.cabal
	https://hackage.haskell.org/package/microlens-0.4.14.0/microlens-0.4.14.0.tar.gz
	https://hackage.haskell.org/package/microlens-0.4.14.0/revision/0.cabal -> microlens-0.4.14.0.cabal
	https://hackage.haskell.org/package/microlens-mtl-0.2.1.0/microlens-mtl-0.2.1.0.tar.gz
	https://hackage.haskell.org/package/microlens-mtl-0.2.1.0/revision/0.cabal -> microlens-mtl-0.2.1.0.cabal
	https://hackage.haskell.org/package/microlens-th-0.4.3.17/microlens-th-0.4.3.17.tar.gz
	https://hackage.haskell.org/package/microlens-th-0.4.3.17/revision/1.cabal -> microlens-th-0.4.3.17.cabal
	https://hackage.haskell.org/package/mime-types-0.1.2.2/mime-types-0.1.2.2.tar.gz
	https://hackage.haskell.org/package/mime-types-0.1.2.2/revision/0.cabal -> mime-types-0.1.2.2.cabal
	https://hackage.haskell.org/package/monad-control-1.0.3.1/monad-control-1.0.3.1.tar.gz
	https://hackage.haskell.org/package/monad-control-1.0.3.1/revision/0.cabal -> monad-control-1.0.3.1.cabal
	https://hackage.haskell.org/package/monad-logger-0.3.42/monad-logger-0.3.42.tar.gz
	https://hackage.haskell.org/package/monad-logger-0.3.42/revision/0.cabal -> monad-logger-0.3.42.cabal
	https://hackage.haskell.org/package/monad-loops-0.4.3/monad-loops-0.4.3.tar.gz
	https://hackage.haskell.org/package/monad-loops-0.4.3/revision/0.cabal -> monad-loops-0.4.3.cabal
	https://hackage.haskell.org/package/mono-traversable-1.0.21.0/mono-traversable-1.0.21.0.tar.gz
	https://hackage.haskell.org/package/mono-traversable-1.0.21.0/revision/0.cabal -> mono-traversable-1.0.21.0.cabal
	https://hackage.haskell.org/package/mtl-compat-0.2.2/mtl-compat-0.2.2.tar.gz
	https://hackage.haskell.org/package/mtl-compat-0.2.2/revision/0.cabal -> mtl-compat-0.2.2.cabal
	https://hackage.haskell.org/package/mustache-2.4.3.1/mustache-2.4.3.1.tar.gz
	https://hackage.haskell.org/package/mustache-2.4.3.1/revision/0.cabal -> mustache-2.4.3.1.cabal
	https://hackage.haskell.org/package/neat-interpolation-0.5.1.4/neat-interpolation-0.5.1.4.tar.gz
	https://hackage.haskell.org/package/neat-interpolation-0.5.1.4/revision/0.cabal -> neat-interpolation-0.5.1.4.cabal
	https://hackage.haskell.org/package/network-3.2.8.0/network-3.2.8.0.tar.gz
	https://hackage.haskell.org/package/network-3.2.8.0/revision/0.cabal -> network-3.2.8.0.cabal
	https://hackage.haskell.org/package/network-byte-order-0.1.8/network-byte-order-0.1.8.tar.gz
	https://hackage.haskell.org/package/network-byte-order-0.1.8/revision/0.cabal -> network-byte-order-0.1.8.cabal
	https://hackage.haskell.org/package/network-uri-2.6.4.2/network-uri-2.6.4.2.tar.gz
	https://hackage.haskell.org/package/network-uri-2.6.4.2/revision/1.cabal -> network-uri-2.6.4.2.cabal
	https://hackage.haskell.org/package/old-locale-1.0.0.7/old-locale-1.0.0.7.tar.gz
	https://hackage.haskell.org/package/old-locale-1.0.0.7/revision/2.cabal -> old-locale-1.0.0.7.cabal
	https://hackage.haskell.org/package/old-time-1.1.1.0/old-time-1.1.1.0.tar.gz
	https://hackage.haskell.org/package/old-time-1.1.1.0/revision/0.cabal -> old-time-1.1.1.0.cabal
	https://hackage.haskell.org/package/OneTuple-0.4.2.1/OneTuple-0.4.2.1.tar.gz
	https://hackage.haskell.org/package/OneTuple-0.4.2.1/revision/0.cabal -> OneTuple-0.4.2.1.cabal
	https://hackage.haskell.org/package/open-browser-0.4.0.0/open-browser-0.4.0.0.tar.gz
	https://hackage.haskell.org/package/open-browser-0.4.0.0/revision/0.cabal -> open-browser-0.4.0.0.cabal
	https://hackage.haskell.org/package/optparse-applicative-0.19.0.0/optparse-applicative-0.19.0.0.tar.gz
	https://hackage.haskell.org/package/optparse-applicative-0.19.0.0/revision/1.cabal -> optparse-applicative-0.19.0.0.cabal
	https://hackage.haskell.org/package/pantry-0.11.2/pantry-0.11.2.tar.gz
	https://hackage.haskell.org/package/pantry-0.11.2/revision/2.cabal -> pantry-0.11.2.cabal
	https://hackage.haskell.org/package/parser-combinators-1.3.1/parser-combinators-1.3.1.tar.gz
	https://hackage.haskell.org/package/parser-combinators-1.3.1/revision/0.cabal -> parser-combinators-1.3.1.cabal
	https://hackage.haskell.org/package/path-0.9.6/path-0.9.6.tar.gz
	https://hackage.haskell.org/package/path-0.9.6/revision/1.cabal -> path-0.9.6.cabal
	https://hackage.haskell.org/package/path-io-1.8.2/path-io-1.8.2.tar.gz
	https://hackage.haskell.org/package/path-io-1.8.2/revision/1.cabal -> path-io-1.8.2.cabal
	https://hackage.haskell.org/package/path-pieces-0.2.1/path-pieces-0.2.1.tar.gz
	https://hackage.haskell.org/package/path-pieces-0.2.1/revision/1.cabal -> path-pieces-0.2.1.cabal
	https://hackage.haskell.org/package/persistent-2.18.1.0/persistent-2.18.1.0.tar.gz
	https://hackage.haskell.org/package/persistent-2.18.1.0/revision/0.cabal -> persistent-2.18.1.0.cabal
	https://hackage.haskell.org/package/persistent-sqlite-2.13.3.1/persistent-sqlite-2.13.3.1.tar.gz
	https://hackage.haskell.org/package/persistent-sqlite-2.13.3.1/revision/0.cabal -> persistent-sqlite-2.13.3.1.cabal
	https://hackage.haskell.org/package/persistent-template-2.12.0.0/persistent-template-2.12.0.0.tar.gz
	https://hackage.haskell.org/package/persistent-template-2.12.0.0/revision/0.cabal -> persistent-template-2.12.0.0.cabal
	https://hackage.haskell.org/package/prettyprinter-1.7.1/prettyprinter-1.7.1.tar.gz
	https://hackage.haskell.org/package/prettyprinter-1.7.1/revision/0.cabal -> prettyprinter-1.7.1.cabal
	https://hackage.haskell.org/package/prettyprinter-ansi-terminal-1.1.3/prettyprinter-ansi-terminal-1.1.3.tar.gz
	https://hackage.haskell.org/package/prettyprinter-ansi-terminal-1.1.3/revision/0.cabal -> prettyprinter-ansi-terminal-1.1.3.cabal
	https://hackage.haskell.org/package/primitive-0.9.1.0/primitive-0.9.1.0.tar.gz
	https://hackage.haskell.org/package/primitive-0.9.1.0/revision/1.cabal -> primitive-0.9.1.0.cabal
	https://hackage.haskell.org/package/project-template-0.2.1.0/project-template-0.2.1.0.tar.gz
	https://hackage.haskell.org/package/project-template-0.2.1.0/revision/0.cabal -> project-template-0.2.1.0.cabal
	https://hackage.haskell.org/package/QuickCheck-2.16.0.0/QuickCheck-2.16.0.0.tar.gz
	https://hackage.haskell.org/package/QuickCheck-2.16.0.0/revision/0.cabal -> QuickCheck-2.16.0.0.cabal
	https://hackage.haskell.org/package/random-1.3.1/random-1.3.1.tar.gz
	https://hackage.haskell.org/package/random-1.3.1/revision/0.cabal -> random-1.3.1.cabal
	https://hackage.haskell.org/package/replace-megaparsec-1.5.0.1/replace-megaparsec-1.5.0.1.tar.gz
	https://hackage.haskell.org/package/replace-megaparsec-1.5.0.1/revision/0.cabal -> replace-megaparsec-1.5.0.1.cabal
	https://hackage.haskell.org/package/resource-pool-0.5.0.0/resource-pool-0.5.0.0.tar.gz
	https://hackage.haskell.org/package/resource-pool-0.5.0.0/revision/0.cabal -> resource-pool-0.5.0.0.cabal
	https://hackage.haskell.org/package/resourcet-1.3.0/resourcet-1.3.0.tar.gz
	https://hackage.haskell.org/package/resourcet-1.3.0/revision/0.cabal -> resourcet-1.3.0.cabal
	https://hackage.haskell.org/package/retry-0.9.3.1/retry-0.9.3.1.tar.gz
	https://hackage.haskell.org/package/retry-0.9.3.1/revision/0.cabal -> retry-0.9.3.1.cabal
	https://hackage.haskell.org/package/rio-0.1.24.0/rio-0.1.24.0.tar.gz
	https://hackage.haskell.org/package/rio-0.1.24.0/revision/0.cabal -> rio-0.1.24.0.cabal
	https://hackage.haskell.org/package/rio-orphans-0.1.2.0/rio-orphans-0.1.2.0.tar.gz
	https://hackage.haskell.org/package/rio-orphans-0.1.2.0/revision/0.cabal -> rio-orphans-0.1.2.0.cabal
	https://hackage.haskell.org/package/rio-prettyprint-0.1.9.0/rio-prettyprint-0.1.9.0.tar.gz
	https://hackage.haskell.org/package/rio-prettyprint-0.1.9.0/revision/0.cabal -> rio-prettyprint-0.1.9.0.cabal
	https://hackage.haskell.org/package/safe-0.3.21/safe-0.3.21.tar.gz
	https://hackage.haskell.org/package/safe-0.3.21/revision/1.cabal -> safe-0.3.21.cabal
	https://hackage.haskell.org/package/safe-exceptions-0.1.7.4/safe-exceptions-0.1.7.4.tar.gz
	https://hackage.haskell.org/package/safe-exceptions-0.1.7.4/revision/1.cabal -> safe-exceptions-0.1.7.4.cabal
	https://hackage.haskell.org/package/scientific-0.3.8.1/scientific-0.3.8.1.tar.gz
	https://hackage.haskell.org/package/scientific-0.3.8.1/revision/0.cabal -> scientific-0.3.8.1.cabal
	https://hackage.haskell.org/package/semialign-1.3.1.1/semialign-1.3.1.1.tar.gz
	https://hackage.haskell.org/package/semialign-1.3.1.1/revision/0.cabal -> semialign-1.3.1.1.cabal
	https://hackage.haskell.org/package/semigroupoids-6.0.2/semigroupoids-6.0.2.tar.gz
	https://hackage.haskell.org/package/semigroupoids-6.0.2/revision/1.cabal -> semigroupoids-6.0.2.cabal
	https://hackage.haskell.org/package/serialise-0.2.6.1/serialise-0.2.6.1.tar.gz
	https://hackage.haskell.org/package/serialise-0.2.6.1/revision/5.cabal -> serialise-0.2.6.1.cabal
	https://hackage.haskell.org/package/silently-1.2.5.4/silently-1.2.5.4.tar.gz
	https://hackage.haskell.org/package/silently-1.2.5.4/revision/0.cabal -> silently-1.2.5.4.cabal
	https://hackage.haskell.org/package/split-0.2.5/split-0.2.5.tar.gz
	https://hackage.haskell.org/package/split-0.2.5/revision/0.cabal -> split-0.2.5.cabal
	https://hackage.haskell.org/package/splitmix-0.1.3.2/splitmix-0.1.3.2.tar.gz
	https://hackage.haskell.org/package/splitmix-0.1.3.2/revision/0.cabal -> splitmix-0.1.3.2.cabal
	https://hackage.haskell.org/package/StateVar-1.2.2/StateVar-1.2.2.tar.gz
	https://hackage.haskell.org/package/StateVar-1.2.2/revision/0.cabal -> StateVar-1.2.2.cabal
	https://hackage.haskell.org/package/static-bytes-0.1.1/static-bytes-0.1.1.tar.gz
	https://hackage.haskell.org/package/static-bytes-0.1.1/revision/0.cabal -> static-bytes-0.1.1.cabal
	https://hackage.haskell.org/package/stm-chans-3.0.0.11/stm-chans-3.0.0.11.tar.gz
	https://hackage.haskell.org/package/stm-chans-3.0.0.11/revision/0.cabal -> stm-chans-3.0.0.11.cabal
	https://hackage.haskell.org/package/streaming-commons-0.2.3.1/streaming-commons-0.2.3.1.tar.gz
	https://hackage.haskell.org/package/streaming-commons-0.2.3.1/revision/0.cabal -> streaming-commons-0.2.3.1.cabal
	https://hackage.haskell.org/package/strict-0.5.1/strict-0.5.1.tar.gz
	https://hackage.haskell.org/package/strict-0.5.1/revision/1.cabal -> strict-0.5.1.cabal
	https://hackage.haskell.org/package/string-interpolate-0.3.4.0/string-interpolate-0.3.4.0.tar.gz
	https://hackage.haskell.org/package/string-interpolate-0.3.4.0/revision/7.cabal -> string-interpolate-0.3.4.0.cabal
	https://hackage.haskell.org/package/syb-0.7.4/syb-0.7.4.tar.gz
	https://hackage.haskell.org/package/syb-0.7.4/revision/0.cabal -> syb-0.7.4.cabal
	https://hackage.haskell.org/package/tagged-0.8.10/tagged-0.8.10.tar.gz
	https://hackage.haskell.org/package/tagged-0.8.10/revision/2.cabal -> tagged-0.8.10.cabal
	https://hackage.haskell.org/package/tar-0.7.0.0/tar-0.7.0.0.tar.gz
	https://hackage.haskell.org/package/tar-0.7.0.0/revision/2.cabal -> tar-0.7.0.0.cabal
	https://hackage.haskell.org/package/tar-conduit-0.4.1/tar-conduit-0.4.1.tar.gz
	https://hackage.haskell.org/package/tar-conduit-0.4.1/revision/0.cabal -> tar-conduit-0.4.1.cabal
	https://hackage.haskell.org/package/tasty-1.5.4/tasty-1.5.4.tar.gz
	https://hackage.haskell.org/package/tasty-1.5.4/revision/1.cabal -> tasty-1.5.4.cabal
	https://hackage.haskell.org/package/temporary-1.3/temporary-1.3.tar.gz
	https://hackage.haskell.org/package/temporary-1.3/revision/0.cabal -> temporary-1.3.cabal
	https://hackage.haskell.org/package/text-conversions-0.3.1.1/text-conversions-0.3.1.1.tar.gz
	https://hackage.haskell.org/package/text-conversions-0.3.1.1/revision/0.cabal -> text-conversions-0.3.1.1.cabal
	https://hackage.haskell.org/package/text-iso8601-0.1.1.1/text-iso8601-0.1.1.1.tar.gz
	https://hackage.haskell.org/package/text-iso8601-0.1.1.1/revision/0.cabal -> text-iso8601-0.1.1.1.cabal
	https://hackage.haskell.org/package/text-metrics-0.3.3/text-metrics-0.3.3.tar.gz
	https://hackage.haskell.org/package/text-metrics-0.3.3/revision/1.cabal -> text-metrics-0.3.3.cabal
	https://hackage.haskell.org/package/text-short-0.1.6.1/text-short-0.1.6.1.tar.gz
	https://hackage.haskell.org/package/text-short-0.1.6.1/revision/0.cabal -> text-short-0.1.6.1.cabal
	https://hackage.haskell.org/package/th-abstraction-0.7.2.0/th-abstraction-0.7.2.0.tar.gz
	https://hackage.haskell.org/package/th-abstraction-0.7.2.0/revision/0.cabal -> th-abstraction-0.7.2.0.cabal
	https://hackage.haskell.org/package/th-compat-0.1.7/th-compat-0.1.7.tar.gz
	https://hackage.haskell.org/package/th-compat-0.1.7/revision/0.cabal -> th-compat-0.1.7.cabal
	https://hackage.haskell.org/package/these-1.2.1/these-1.2.1.tar.gz
	https://hackage.haskell.org/package/these-1.2.1/revision/3.cabal -> these-1.2.1.cabal
	https://hackage.haskell.org/package/th-expand-syns-0.4.12.0/th-expand-syns-0.4.12.0.tar.gz
	https://hackage.haskell.org/package/th-expand-syns-0.4.12.0/revision/1.cabal -> th-expand-syns-0.4.12.0.cabal
	https://hackage.haskell.org/package/th-lift-0.8.7/th-lift-0.8.7.tar.gz
	https://hackage.haskell.org/package/th-lift-0.8.7/revision/0.cabal -> th-lift-0.8.7.cabal
	https://hackage.haskell.org/package/th-lift-instances-0.1.20/th-lift-instances-0.1.20.tar.gz
	https://hackage.haskell.org/package/th-lift-instances-0.1.20/revision/0.cabal -> th-lift-instances-0.1.20.cabal
	https://hackage.haskell.org/package/th-orphans-0.13.17/th-orphans-0.13.17.tar.gz
	https://hackage.haskell.org/package/th-orphans-0.13.17/revision/0.cabal -> th-orphans-0.13.17.cabal
	https://hackage.haskell.org/package/th-reify-many-0.1.10/th-reify-many-0.1.10.tar.gz
	https://hackage.haskell.org/package/th-reify-many-0.1.10/revision/0.cabal -> th-reify-many-0.1.10.cabal
	https://hackage.haskell.org/package/time-compat-1.9.9/time-compat-1.9.9.tar.gz
	https://hackage.haskell.org/package/time-compat-1.9.9/revision/1.cabal -> time-compat-1.9.9.cabal
	https://hackage.haskell.org/package/time-hourglass-0.3.0/time-hourglass-0.3.0.tar.gz
	https://hackage.haskell.org/package/time-hourglass-0.3.0/revision/0.cabal -> time-hourglass-0.3.0.cabal
	https://hackage.haskell.org/package/tls-2.2.2/tls-2.2.2.tar.gz
	https://hackage.haskell.org/package/tls-2.2.2/revision/1.cabal -> tls-2.2.2.cabal
	https://hackage.haskell.org/package/transformers-base-0.4.6.1/transformers-base-0.4.6.1.tar.gz
	https://hackage.haskell.org/package/transformers-base-0.4.6.1/revision/0.cabal -> transformers-base-0.4.6.1.cabal
	https://hackage.haskell.org/package/transformers-compat-0.7.2/transformers-compat-0.7.2.tar.gz
	https://hackage.haskell.org/package/transformers-compat-0.7.2/revision/0.cabal -> transformers-compat-0.7.2.cabal
	https://hackage.haskell.org/package/typed-process-0.2.13.0/typed-process-0.2.13.0.tar.gz
	https://hackage.haskell.org/package/typed-process-0.2.13.0/revision/0.cabal -> typed-process-0.2.13.0.cabal
	https://hackage.haskell.org/package/unix-compat-0.7.4.1/unix-compat-0.7.4.1.tar.gz
	https://hackage.haskell.org/package/unix-compat-0.7.4.1/revision/0.cabal -> unix-compat-0.7.4.1.cabal
	https://hackage.haskell.org/package/unix-time-0.4.17/unix-time-0.4.17.tar.gz
	https://hackage.haskell.org/package/unix-time-0.4.17/revision/0.cabal -> unix-time-0.4.17.cabal
	https://hackage.haskell.org/package/unliftio-0.2.25.1/unliftio-0.2.25.1.tar.gz
	https://hackage.haskell.org/package/unliftio-0.2.25.1/revision/0.cabal -> unliftio-0.2.25.1.cabal
	https://hackage.haskell.org/package/unliftio-core-0.2.1.0/unliftio-core-0.2.1.0.tar.gz
	https://hackage.haskell.org/package/unliftio-core-0.2.1.0/revision/4.cabal -> unliftio-core-0.2.1.0.cabal
	https://hackage.haskell.org/package/unordered-containers-0.2.21/unordered-containers-0.2.21.tar.gz
	https://hackage.haskell.org/package/unordered-containers-0.2.21/revision/2.cabal -> unordered-containers-0.2.21.cabal
	https://hackage.haskell.org/package/utf8-string-1.0.2/utf8-string-1.0.2.tar.gz
	https://hackage.haskell.org/package/utf8-string-1.0.2/revision/0.cabal -> utf8-string-1.0.2.cabal
	https://hackage.haskell.org/package/uuid-types-1.0.6.1/uuid-types-1.0.6.1.tar.gz
	https://hackage.haskell.org/package/uuid-types-1.0.6.1/revision/0.cabal -> uuid-types-1.0.6.1.cabal
	https://hackage.haskell.org/package/vault-0.3.1.6/vault-0.3.1.6.tar.gz
	https://hackage.haskell.org/package/vault-0.3.1.6/revision/0.cabal -> vault-0.3.1.6.cabal
	https://hackage.haskell.org/package/vector-0.13.2.0/vector-0.13.2.0.tar.gz
	https://hackage.haskell.org/package/vector-0.13.2.0/revision/5.cabal -> vector-0.13.2.0.cabal
	https://hackage.haskell.org/package/vector-algorithms-0.9.1.0/vector-algorithms-0.9.1.0.tar.gz
	https://hackage.haskell.org/package/vector-algorithms-0.9.1.0/revision/1.cabal -> vector-algorithms-0.9.1.0.cabal
	https://hackage.haskell.org/package/vector-stream-0.1.0.1/vector-stream-0.1.0.1.tar.gz
	https://hackage.haskell.org/package/vector-stream-0.1.0.1/revision/4.cabal -> vector-stream-0.1.0.1.cabal
	https://hackage.haskell.org/package/witherable-0.5/witherable-0.5.tar.gz
	https://hackage.haskell.org/package/witherable-0.5/revision/2.cabal -> witherable-0.5.cabal
	https://hackage.haskell.org/package/yaml-0.11.11.2/yaml-0.11.11.2.tar.gz
	https://hackage.haskell.org/package/yaml-0.11.11.2/revision/2.cabal -> yaml-0.11.11.2.cabal
	https://hackage.haskell.org/package/zip-archive-0.4.3.2/zip-archive-0.4.3.2.tar.gz
	https://hackage.haskell.org/package/zip-archive-0.4.3.2/revision/1.cabal -> zip-archive-0.4.3.2.cabal
	https://hackage.haskell.org/package/zlib-0.7.1.1/zlib-0.7.1.1.tar.gz
	https://hackage.haskell.org/package/zlib-0.7.1.1/revision/1.cabal -> zlib-0.7.1.1.cabal
"

LICENSE="BSD GPL-3 LGPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	dev-libs/gmp:=
	dev-libs/libffi:=
	virtual/zlib:=
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/ghc
	dev-haskell/cabal-install
	virtual/pkgconfig
"

QA_CONFIGURE_OPTIONS="--with-compiler --with-cc"

src_unpack() {
	unpack "${P}.tar.gz"

	mkdir -p "${WORKDIR}/vendor" || die
	local f
	for f in ${A}; do
		[[ "${f}" == "${P}.tar.gz" ]] && continue
		ln -s "${DISTDIR}/${f}" "${WORKDIR}/vendor/${f}" || die
	done

	cat <<-EOF >> "${T}/cabal.config"
	repository local
	  url: file+noindex://${WORKDIR}/vendor
	EOF
	export CABAL_CONFIG="${T}/cabal.config"
}

src_prepare() {
	echo "packages: ." > cabal.project
	cp "${FILESDIR}/${PF}.freeze" cabal.project.freeze || die

	default
}

src_configure() {
	filter-lto

	GHC_OPTIONS="${HCFLAGS}"
	local flag
	for flag in ${CFLAGS}; do
		GHC_OPTIONS+=" -optc${flag}"
	done
	GHC_OPTIONS+=" -optl-Wl,-z,relro"
	GHC_OPTIONS+=" -optl-Wl,-z,now"

	local cabal_conf=(
		--enable-optimization=2
		--disable-executable-stripping
		--disable-library-stripping
		--disable-tests
		--ghc-options="${GHC_OPTIONS}"
		--jobs=$(makeopts_jobs)
		--flags="-developer-mode disable-git-info -integration-tests"
		--allow-newer="cborg:base"
		--allow-newer="cborg:containers"
		--allow-newer="persistent:template-haskell"
		--allow-newer="serialise:base"
		--allow-newer="serialise:containers"
		--allow-newer="serialise:time"
	)

	edo ${CABAL:-cabal} v2-configure "${cabal_conf[@]}"
}

src_compile() {
	edo ${CABAL:-cabal} v2-build --builddir="${WORKDIR}/_build"
}

src_install() {
	cp "${WORKDIR}"/_build/build/x86_64-linux/ghc-*/${P}/opt/build/stack/stack "${T}"/stack

	dobin "${T}"/stack

	"${T}"/stack --bash-completion-script stack > "${T}"/stack.bash
	"${T}"/stack --zsh-completion-script stack > "${T}"/stack.zsh
	"${T}"/stack --fish-completion-script stack > "${T}"/stack.fish

	newbashcomp "${T}"/stack.bash stack
	newzshcomp "${T}"/stack.zsh _stack
	dofishcomp "${T}"/stack.fish
}
