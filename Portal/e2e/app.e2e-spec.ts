import { LMSTemplatePage } from './app.po';

describe('LMS App', function() {
  let page: LMSTemplatePage;

  beforeEach(() => {
    page = new LMSTemplatePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
