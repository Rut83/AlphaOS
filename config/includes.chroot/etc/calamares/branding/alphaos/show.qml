import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    Slide {
        Image {
            anchors.fill: parent
            source: "background.png"
            fillMode: Image.PreserveAspectCrop
        }

        Image {
            anchors.centerIn: parent
            source: "logo-no-background.png"
            width: 180
            height: 180
            fillMode: Image.PreserveAspectFit
        }
    }

    function onActivate() {
        presentation.currentSlide = 0
    }

    function onLeave() {
    }
}
