import React, { Component } from 'react';
import VideoBackground from '../component/VideoBackground';
import ZigZag from '../component/ZigZagDesign';
import YoutubeAPI from '../component/YoutubeAPI';
import CarouselTastamonials from '../component/CarouselLandingPage';
import DevelopersCards from '../component/Cards/LandingPageCards';
import Covid from '../component/CoronaInjuries/corona';
import { Element } from 'react-scroll';

export class LandingPage extends Component {
  render() {
    return (
      <section>
        <VideoBackground />
        <Element name='test1' className='element'>
          <Covid />
          <ZigZag />
        </Element>
        <YoutubeAPI />
        <CarouselTastamonials />
        <DevelopersCards />
      </section>
    );
  }
}

export default LandingPage;
