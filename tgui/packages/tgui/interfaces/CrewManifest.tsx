import { useBackend } from 'tgui/backend'
import { Section, Table } from 'tgui/components'
import { Window } from 'tgui/layouts'
import { classes } from '../../common/react'

type CrewMember = {
  name: string
  rank: string
  status: string
}

type CrewManifest = {
  heads: CrewMember[]
  sci: CrewMember[]
  sec: CrewMember[]
  bls: CrewMember[]
  eng: CrewMember[]
  med: CrewMember[]
  sup: CrewMember[]
  chr: CrewMember[]
  pro: CrewMember[]
  bot: CrewMember[]
  civ: CrewMember[]
  ldg: CrewMember[]
}

type Data = {
  manifest: CrewManifest
}

export const CrewManifest = props => {
  const { act, data } = useBackend<Data>()

  let { manifest } = data

  let sortedManifest = Object.entries(manifest).filter(([dept, crew]) => crew.length > 0).sort(([a, _a], [b, _b]) => {
    return (
      Object.keys(departmentData).indexOf(a) -
      Object.keys(departmentData).indexOf(b)
    )
  })

  return (
    <Window width={450} height={600}>
      <Window.Content scrollable>
        {sortedManifest
          .map(([dept, crew]) => (
            <Section
              className={'CrewManifest--' + dept}
              title={departmentData[dept].name}
              key={dept}
            >
              <Table>
                {crew.map(crew => (
                  <Table.Row key={crew.name + crew.rank}>
                    <Table.Cell
                      className='CrewManifest__Cell'
                      maxWidth='135px'
                      overflow='hidden'
                      width='40%'
                    >
                      {crew.name}
                    </Table.Cell>
                    <Table.Cell
                      className={classes([
                        'CrewManifest__Cell',
                        'CrewManifest__Cell--Rank'
                      ])}
                      maxWidth='135px'
                      overflow='hidden'
                      width='40%'
                    >
                      {crew.rank}
                    </Table.Cell>
                    <Table.Cell
                      className='CrewManifest__Cell'
                      maxWidth='40px'
                      overflow='hidden'
                      width='20%'
                    >
                      {crew.status}
                    </Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          ))}
      </Window.Content>
    </Window>
  )
}

const departmentData = {
  heads: { name: 'Command Staff' },
  sec: { name: 'Security - Marshals' },
  bls: { name: 'Security - Blackshield' },
  med: { name: 'Soteria Medical' },
  sci: { name: 'Soteria Research' },
  chr: { name: 'Church of the Absolute' },
  sup: { name: 'Lonestar Shipping Solutions' },
  eng: { name: 'Artificers Guild' },
  pro: { name: 'Prospector' },
  civ: { name: 'Civilian' },
  bot: { name: 'Silicon' },
  ldg: { name: 'Lodge' }
}
