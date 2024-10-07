# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="
	3270? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/3270.zip -> 3270-${PV}.zip )
	agave? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Agave.zip -> Agave-${PV}.zip )
	anonymouspro? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/AnonymousPro.zip -> AnonymousPro-${PV}.zip )
	arimo? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Arimo.zip -> Arimo-${PV}.zip )
	aurulentsansmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/AurulentSansMono.zip -> AurulentSansMono-${PV}.zip )
	bigblueterminal? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/BigBlueTerminal.zip -> BigBlueTerminal-${PV}.zip )
	bitstreamverasansmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/BitstreamVeraSansMono.zip -> BitstreamVeraSansMono-${PV}.zip )
	cascadiacode? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CascadiaCode.zip -> CascadiaCode-${PV}.zip )
	codenewroman? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CodeNewRoman.zip -> CodeNewRoman-${PV}.zip )
	cousine? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Cousine.zip -> Cousine-${PV}.zip )
	daddytimemono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DaddyTimeMono.zip -> DaddyTimeMono-${PV}.zip )
	dejavusansmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DejaVuSansMono.zip -> DejaVuSansMono-${PV}.zip )
	droidsansmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DroidSansMono.zip -> DroidSansMono-${PV}.zip )
	fantasquesansmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FantasqueSansMono.zip -> FantasqueSansMono-${PV}.zip )
	firacode? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FiraCode.zip -> FiraCode-${PV}.zip )
	firamono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FiraMono.zip -> FiraMono-${PV}.zip )
	gomono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Go-Mono.zip -> Go-Mono-${PV}.zip )
	gohu? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Gohu.zip -> Gohu-${PV}.zip )
	hack? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hack.zip -> Hack-${PV}.zip )
	hasklig? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hasklig.zip -> Hasklig-${PV}.zip )
	heavydata? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/HeavyData.zip -> HeavyData-${PV}.zip )
	hermit? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hermit.zip -> Hermit-${PV}.zip )
	iawriter? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/iA-Writer.zip -> iA-Writer-${PV}.zip )
	ibmplexmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/IBMPlexMono.zip -> IBMPlexMono-${PV}.zip )
	inconsolata? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Inconsolata.zip -> Inconsolata-${PV}.zip )
	inconsolatago? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/InconsolataGo.zip -> InconsolataGo-${PV}.zip )
	inconsolatalgc? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/InconsolataLGC.zip -> InconsolataLGC-${PV}.zip )
	iosevka? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Iosevka.zip -> Iosevka-${PV}.zip )
	jetbrainsmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/JetBrainsMono.zip -> JetBrainsMono-${PV}.zip )
	lekton? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Lekton.zip -> Lekton-${PV}.zip )
	liberationmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/LiberationMono.zip -> LiberationMono-${PV}.zip )
	lilex? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Lilex.zip -> Lilex-${PV}.zip )
	meslo? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Meslo.zip -> Meslo-${PV}.zip )
	monofur? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Monofur.zip -> Monofur-${PV}.zip )
	monoid? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Monoid.zip -> Monoid-${PV}.zip )
	mononoki? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Mononoki.zip -> Mononoki-${PV}.zip )
	mplus? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/MPlus.zip -> MPlus-${PV}.zip )
	nerdfontssymbolsonly? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/NerdFontsSymbolsOnly.zip -> NerdFontsSymbolsOnly-${PV}.zip )
	noto? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Noto.zip -> Noto-${PV}.zip )
	opendyslexic? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/OpenDyslexic.zip -> OpenDyslexic-${PV}.zip )
	overpass? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Overpass.zip -> Overpass-${PV}.zip )
	profont? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ProFont.zip -> ProFont-${PV}.zip )
	proggyclean? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ProggyClean.zip -> ProggyClean-${PV}.zip )
	robotomono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/RobotoMono.zip -> RobotoMono-${PV}.zip )
	sharetechmono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ShareTechMono.zip -> ShareTechMono-${PV}.zip )
	sourcecodepro? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/SourceCodePro.zip -> SourceCodePro-${PV}.zip )
	spacemono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/SpaceMono.zip -> SpaceMono-${PV}.zip )
	terminus? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Terminus.zip -> Terminus-${PV}.zip )
	tinos? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Tinos.zip -> Tinos-${PV}.zip )
	ubuntu? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Ubuntu.zip -> Ubuntu-${PV}.zip )
	ubuntumono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/UbuntuMono.zip -> UbuntuMono-${PV}.zip )
	victormono? ( https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/VictorMono.zip -> VictorMono-${PV}.zip )
"

S="${WORKDIR}"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

IUSE_FONTS="3270 agave anonymouspro arimo aurulentsansmono bigblueterminal
bitstreamverasansmono cascadiacode codenewroman cousine daddytimemono
dejavusansmono droidsansmono fantasquesansmono firacode firamono gomono gohu
hack hasklig heavydata hermit iawriter ibmplexmono inconsolata inconsolatago
inconsolatalgc iosevka jetbrainsmono lekton liberationmono lilex meslo monofur
monoid mononoki mplus nerdfontssymbolsonly noto opendyslexic overpass profont
proggyclean robotomono sharetechmono sourcecodepro spacemono terminus tinos
ubuntu ubuntumono victormono"

IUSE="${IUSE_FONTS}"
REQUIRED_USE="|| ( ${IUSE_FONTS} )"

RDEPEND="
	firacode? ( !media-fonts/firacode-nerdfont )
	iosevka? ( !media-fonts/iosevka-nerdfont )
	jetbrainsmono? ( !media-fonts/jetbrainsmono-nerdfont )
	robotomono? ( !media-fonts/robotomono-nerdfont )
	ubuntumono? ( !media-fonts/ubuntumono-nerdfont )
"

FONT_SUFFIX=""

src_install() {
	for suffix in ttf otf; do
		if nonfatal compgen -G "*.${suffix}" > /dev/null; then
			FONT_SUFFIX+=" ${suffix}"
		fi
	done

	font_src_install
}
