# frozen_string_literal: true

# Size.destroy_all
# Size.create(id: 1,
#             description: 'Small',
#             price: 10).save
# Size.create(id: 2,
#             description: 'Medium',
#             price: 15).save
# Size.create(id: 3,
#             description: 'Large',
#             price: 20).save

# # ------------------------------------------------------

# Detail.destroy_all
# Detail.create(id: 1,
#               description: 'Simple',
#               price: 10).save
# Detail.create(id: 2,
#               description: 'Intricate',
#               price: 15).save
# Detail.create(id: 3,
#               description: 'Elaborate',
#               price: 20).save

# # ------------------------------------------------------

# Piece.destroy_all
# Piece.create(name: 'Small and Simple',
#              sizeId: 1,
#              detailId: 1,
#              image: '',
#              dimensions: '15cm x 25cm').save

# Piece.create(name: 'Medium and Intricate',
#              sizeId: 2,
#              detailId: 2,
#              image: '',
#              dimensions: '20cm x 30cm').save

# Piece.create(name: 'Large and Elaborate',
#              sizeId: 3,
#              detailId: 3,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Bold and Brash',
#              sizeId: 3,
#              detailId: 3,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Elephant',
#              sizeId: 1,
#              detailId: 2,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Tower',
#              sizeId: 2,
#              detailId: 1,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Hotdog',
#              sizeId: 3,
#              detailId: 1,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Blueberries',
#              sizeId: 2,
#              detailId: 2,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Lafawnduh',
#              sizeId: 3,
#              detailId: 3,
#              image: '',
#              dimensions: '25cm x 35cm').save

# Piece.create(name: 'Elmers Glue',
#              sizeId: 1,
#              detailId: 1,
#              image: '',
#              dimensions: '25cm x 35cm').save

# # ------------------------------------------------------
Province.create(
  name: 'Alberta',
  code: 'AB'
).save

Province.create(
  name: 'British Columbia',
  code: 'BC'
).save

Province.create(
  name: 'Manitoba',
  code: 'MB'
).save

Province.create(
  name: 'New Brunswick',
  code: 'NB'
).save

Province.create(
  name: 'Newfoundland',
  code: 'NL'
).save

Province.create(
  name: 'Nova Scotia',
  code: 'NS'
).save

Province.create(
  name: 'Northwest Terrirories',
  code: 'NT'
).save

Province.create(
  name: 'Nunavut',
  code: 'NU'
).save

Province.create(
  name: 'Ontario',
  code: 'ON'
).save

Province.create(
  name: 'PEI',
  code: 'PE'
).save

Province.create(
  name: 'Quebec',
  code: 'QC'
).save

Province.create(
  name: 'Saskatchewan',
  code: 'SK'
).save

Province.create(
  name: 'Yukon',
  code: 'YT'
).save
