require 'rails_helper'

describe 'when admin images home page ' do
  scenario ' they can create new image by filling out a form' do
    title = 'Image1'
    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'

    visit images_path
    click_on 'Create New Image'

    expect(current_path).to eq(new_image_path)

    fill_in 'image[title]', with: title
    fill_in 'image[url]', with: url

    click_on 'Create Image'

    expect(current_path).to eq(image_path(Image.last))

    expect(page).to have_content(title)
  end

  scenario ' they can create new image by filling out a form' do
    title = 'Image1'
    title1 = 'my pic'
    title2 = 'pic top'
    title3 = 'top pic'
    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'

    image = Image.create(title: title, url: url)
    image = Image.create(title: title1, url: url)
    image = Image.create(title: title2, url: url)
    image = Image.create(title: title3, url: url)


    visit images_path

    expect(page).to have_content(title)
    expect(page).to have_content(title1)
    expect(page).to have_content(title2)
    expect(page).to have_content(title3)
  end
end